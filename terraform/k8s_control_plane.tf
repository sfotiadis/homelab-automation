# Kubernetes Control Plane Configuration

# Control Plane Node 1
module "k8s_cp_01" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-cp-01"
  vm_id            = var.k8s_cp_vm_ids[0]
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_cp_cpu_cores
  memory           = var.k8s_cp_memory
  disk_size        = var.k8s_cp_disk_size
  ip_address       = var.k8s_cp_ips[0]
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}

# Control Plane Node 2
module "k8s_cp_02" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-cp-02"
  vm_id            = var.k8s_cp_vm_ids[1]
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_cp_cpu_cores
  memory           = var.k8s_cp_memory
  disk_size        = var.k8s_cp_disk_size
  ip_address       = var.k8s_cp_ips[1]
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}

# Control Plane Node 3
module "k8s_cp_03" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-cp-03"
  vm_id            = var.k8s_cp_vm_ids[2]
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_cp_cpu_cores
  memory           = var.k8s_cp_memory
  disk_size        = var.k8s_cp_disk_size
  ip_address       = var.k8s_cp_ips[2]
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}

# Load Balancer (HAProxy for K8s API)
module "k8s_lb" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-lb-01"
  vm_id            = var.k8s_lb_vm_id
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_lb_cpu_cores
  memory           = var.k8s_lb_memory
  disk_size        = var.k8s_lb_disk_size
  ip_address       = var.k8s_lb_ip
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}
