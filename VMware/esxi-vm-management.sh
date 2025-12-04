state="$1"
vmName="$2"
cpu="$3"
memory="$4"
storage="$5"
datastore="$6"
isoFile="$7"
guest_os="$8"

vmPath="/vmfs/volumes/$datastore/$vmName"
vmxFile="$vmPath/$vmName.vmx"

# Helper function: map (add/update) key=value pair in .vmx file
map() {
    key="$1"
    value="$2"

    if grep -q "^$key = " "$vmxFile"; then
        current=$(grep "^$key = " "$vmxFile" | sed -e 's/.*= "\(.*\)".*/\1/')

        # If key exists, compare and update if different
        if [ "$current" != "$value" ]; then
          sed -i "s|^$key = \".*\"|$key = \"$value\"|" "$vmxFile"
          echo "changed"
        fi
    else
        # If key missing, append it
        echo "$key = \"$value\"" >> "$vmxFile"
        echo "changed"
    fi
}

if [ "$state" = "present" ]; then
    # Get VM ID
    vmId=$(vim-cmd vmsvc/getallvms | awk -v name="$vmName" '$2 == name {print $1}')

    if [ -z "$vmId" ]; then
        vim-cmd vmsvc/createdummyvm "$vmName" "[$datastore] $vmName"
        vmId=$(vim-cmd vmsvc/getallvms | awk -v name="$vmName" '$2 == name {print $1}')

        # Configure disk
        # - Remove the dummy disks
        rm -f "$vmPath/$vmName.vmdk" "$vmPath/$vmName-flat.vmdk"
        # - Create thin disk
        vmkfstools -c "$storage"G -d thin "$vmPath/$vmName.vmdk"
        # - Attach disk
        vim-cmd vmsvc/device.diskaddexisting "$vmId" "$vmPath/$vmName.vmdk"

        echo "changed"
    fi

    # 1. Configure CPU
    map "numvcpus" "$cpu"

    # 2. Configure memory
    map "memSize" "$((memory * 1024))"

    # 3. Configure guest OS
    map "guestOS" "$guest_os"

    # 4. Configure storage controller
    map "scsi0.virtualDev" "pvscsi"
    map "scsi0.present" "TRUE"
    map "scsi0:0.present" "TRUE"
    map "scsi0:0.deviceType" "scsi-hardDisk"
    map "scsi0:0.fileName" "$vmName.vmdk"

    # 5. Configure NIC
    map "ethernet0.virtualDev" "vmxnet3"
    map "ethernet0.networkName" "VM Network"
    map "ethernet0.present" "TRUE"

    # 6. Configure ISO CD-ROM via SATA
    map "sata0.present" "TRUE"
    map "sata0:0.present" "TRUE"
    map "sata0:0.deviceType" "cdrom-image"
    map "sata0:0.fileName" "/vmfs/volumes/${datastore}/${vmName}/${isoFile}"
    map "sata0:0.startConnected" "TRUE"

    # 7. Configure UEFI + Secure Boot
    map "firmware" "efi"
    map "uefi.secureBoot.enabled" "TRUE"

    # Apply changes
    vim-cmd vmsvc/reload "$vmId"
elif [ "$state" = "absent" ]; then
    # Get VM ID
    vmId=$(vim-cmd vmsvc/getallvms | awk -v name="$vmName" '$2 == name {print $1}')

    # Stop the VM if it is running
    if [ ! -z "$vmId" ]; then
        if [ "$(vim-cmd vmsvc/power.getstate "$vmId" | tail -n1)" = "Powered on" ]; then
            vim-cmd vmsvc/power.off "$vmId"
        fi

        vim-cmd vmsvc/unregister "$vmId"
        rm -rf "/vmfs/volumes/$datastore/$vmName"
        echo "changed"
    fi
else
  echo "Invalid state: $state. Use 'present' or 'absent'."
fi