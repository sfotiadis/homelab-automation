# Kubernetes Worker Nodes Configuration

# Worker Node 1
module "k8s_worker_01" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-worker-01"
  vm_id            = var.k8s_worker_vm_ids[0]
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_worker_cpu_cores
  memory           = var.k8s_worker_memory
  disk_size        = var.k8s_worker_disk_size
  ip_address       = var.k8s_worker_ips[0]
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}

# Worker Node 2
module "k8s_worker_02" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-worker-02"
  vm_id            = var.k8s_worker_vm_ids[1]
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_worker_cpu_cores
  memory           = var.k8s_worker_memory
  disk_size        = var.k8s_worker_disk_size
  ip_address       = var.k8s_worker_ips[1]
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}

# Worker Node 3
module "k8s_worker_03" {
  source = "./modules/proxmox_vm"
  
  vm_name          = "k8s-worker-03"
  vm_id            = var.k8s_worker_vm_ids[2]
  proxmox_node     = var.proxmox_node
  template_name    = "ubuntu-2404-template"
  cpu_cores        = var.k8s_worker_cpu_cores
  memory           = var.k8s_worker_memory
  disk_size        = var.k8s_worker_disk_size
  ip_address       = var.k8s_worker_ips[2]
  network_gateway  = var.network_gateway
  network_cidr     = var.network_cidr
  ssh_public_key   = var.ssh_public_key
}
