# Kubernetes Cluster Variables

# Control Plane IPs
variable "k8s_cp_ips" {
  description = "Kubernetes Control Plane node IPs"
  type        = list(string)
}

# Worker Node IPs
variable "k8s_worker_ips" {
  description = "Kubernetes Worker node IPs"
  type        = list(string)
}

# Load Balancer IP
variable "k8s_lb_ip" {
  description = "HAProxy Load Balancer IP for K8s API"
  type        = string
}

# VM IDs
variable "k8s_cp_vm_ids" {
  description = "VM IDs for Control Plane nodes"
  type        = list(number)
  default     = [301, 302, 303]
}

variable "k8s_worker_vm_ids" {
  description = "VM IDs for Worker nodes"
  type        = list(number)
  default     = [311, 312, 313]
}

variable "k8s_lb_vm_id" {
  description = "VM ID for Load Balancer"
  type        = number
  default     = 305
}

# Control Plane Specs
variable "k8s_cp_cpu_cores" {
  description = "CPU cores for Control Plane nodes"
  type        = number
  default     = 4
}

variable "k8s_cp_memory" {
  description = "Memory in MB for Control Plane nodes"
  type        = number
  default     = 8192
}

variable "k8s_cp_disk_size" {
  description = "Disk size for Control Plane nodes"
  type        = string
  default     = "50G"
}

# Worker Specs
variable "k8s_worker_cpu_cores" {
  description = "CPU cores for Worker nodes"
  type        = number
  default     = 8
}

variable "k8s_worker_memory" {
  description = "Memory in MB for Worker nodes"
  type        = number
  default     = 20480
}

variable "k8s_worker_disk_size" {
  description = "Disk size for Worker nodes"
  type        = string
  default     = "100G"
}

# Load Balancer Specs
variable "k8s_lb_cpu_cores" {
  description = "CPU cores for Load Balancer"
  type        = number
  default     = 2
}

variable "k8s_lb_memory" {
  description = "Memory in MB for Load Balancer"
  type        = number
  default     = 4096
}

variable "k8s_lb_disk_size" {
  description = "Disk size for Load Balancer"
  type        = string
  default     = "30G"
}
