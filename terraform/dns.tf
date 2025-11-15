# DNS Server Configuration

# DNS Server 1 (Primary)
resource "proxmox_vm_qemu" "dns1" {
  name        = "dns1"
  target_node = var.proxmox_node
  vmid        = 201
  
  clone = "ubuntu-2404-template"

  cpu {
    cores   = 2
    sockets = 1
  }
  memory  = 2048
  
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "20G"
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }
  
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  
  ipconfig0 = "ip=${var.dns1_ip}/${var.network_cidr},gw=${var.network_gateway}"
  
  ciuser  = "ubuntu"
  sshkeys = var.ssh_public_key
  
  agent = 1
  
  automatic_reboot = true
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}

# DNS Server 2 (Secondary)
resource "proxmox_vm_qemu" "dns2" {
  name        = "dns2"
  target_node = var.proxmox_node
  vmid        = 202
  
  clone = "ubuntu-2404-template"

  cpu {
    cores   = 2
    sockets = 1
  }
  memory  = 2048
  
  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = "20G"
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }
  
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  
  ipconfig0 = "ip=${var.dns2_ip}/${var.network_cidr},gw=${var.network_gateway}"
  
  ciuser  = "ubuntu"
  sshkeys = var.ssh_public_key
  
  agent = 1
  
  automatic_reboot = true
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
