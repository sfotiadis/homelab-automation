# DNS Server Configuration

# DNS Server 1 (Primary)
module "dns1" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "dns1"
  vm_id            = 201
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  ip_address       = var.dns1_ip
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}

# DNS Server 2 (Secondary)
module "dns2" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "dns2"
  vm_id            = 202
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  ip_address       = var.dns2_ip
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}
