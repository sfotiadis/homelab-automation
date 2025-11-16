# Proxmox VM Module
# Reusable VM configuration for Proxmox VE

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.proxmox_node
  vmid        = var.vm_id
  
  clone = var.template_name

  cpu {
    cores   = var.cpu_cores
    sockets = 1
  }
  memory = var.memory
  
  disks {
    scsi {
      scsi0 {
        disk {
          storage = var.storage
          size    = var.disk_size
        }
      }
    }
    ide {
      ide2 {
        cloudinit {
          storage = var.storage
        }
      }
    }
  }
  
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  
  ipconfig0 = "ip=${var.ip_address}/${var.network_cidr},gw=${var.network_gateway}"
  
  ciuser  = var.ssh_user
  sshkeys = var.ssh_public_key
  
  agent = 1
  
  automatic_reboot = true
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
}
