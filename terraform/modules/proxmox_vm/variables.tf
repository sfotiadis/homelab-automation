# Proxmox VM Module Variables

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_id" {
  description = "VM ID in Proxmox"
  type        = number
}

variable "proxmox_node" {
  description = "Proxmox node name"
  type        = string
}

variable "template_name" {
  description = "Template to clone from"
  type        = string
  default     = "ubuntu-2404-template"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Disk size (e.g., 20G)"
  type        = string
  default     = "20G"
}

variable "storage" {
  description = "Storage pool name"
  type        = string
  default     = "local-lvm"
}

variable "ip_address" {
  description = "Static IP address for the VM"
  type        = string
}

variable "network_cidr" {
  description = "Network CIDR (e.g., 24)"
  type        = string
  default     = "24"
}

variable "network_gateway" {
  description = "Network gateway IP"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for cloud-init"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
}
