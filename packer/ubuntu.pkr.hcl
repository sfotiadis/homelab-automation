packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.8"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

# Proxmox connection variables
variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "proxmox_node" {
  type    = string
  default = "pve"
}

source "proxmox-iso" "ubuntu" {
  proxmox_url              = var.proxmox_api_url
  insecure_skip_tls_verify = true
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  
  node    = var.proxmox_node
  vm_id   = 9000
  vm_name = "ubuntu-2404-template"
  
  # Boot from local ISO
  boot_iso {
    type             = "scsi"
    iso_file         = "local:iso/ubuntu-24.04.3-live-server-amd64.iso"
    unmount          = true
  }
  
  cores  = 2
  memory = 2048
  
  scsi_controller = "virtio-scsi-single"
  
  disks {
    disk_size    = "20G"
    storage_pool = "local-lvm"
    type         = "scsi"
  }
  
  network_adapters {
    model  = "virtio"
    bridge = "vmbr0"
  }
  
  cloud_init              = true
  cloud_init_storage_pool = "local-lvm"
  
  # Ubuntu autoinstall boot sequence
  boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    "<bs><bs><bs><bs><wait>",
    "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
    "<f10><wait>"
  ]
  boot_wait = "5s"
  
  http_directory = "http"
  
  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_timeout  = "20m"
}

build {
  sources = ["source.proxmox-iso.ubuntu"]
  
  # Install qemu-guest-agent
  provisioner "shell" {
    inline = [
      "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
      "sudo apt-get update",
      "sudo apt-get install -y qemu-guest-agent",
      "sudo systemctl enable qemu-guest-agent"
    ]
  }
  
  # Clean up cloud-init for template use
  provisioner "shell" {
    inline = [
      "sudo rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg",
      "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
      "sudo cloud-init clean",
      "sudo sync"
    ]
  }
}
