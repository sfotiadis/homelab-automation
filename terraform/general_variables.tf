# General Terraform Variables

# Proxmox Connection
variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
}

# Proxmox Settings
variable "proxmox_node" {
  description = "Proxmox Node Name"
  type        = string
  default     = "pve"
}

variable "template_id" {
  description = "VM Template ID (Ubuntu Cloud-Init Template)"
  type        = number
  default     = 9000
}

# Network Settings
variable "network_gateway" {
  description = "Default Gateway"
  type        = string
}

variable "network_cidr" {
  description = "Network CIDR for VMs"
  type        = string
  default     = "24"
}

# SSH Key
variable "ssh_public_key" {
  description = "SSH Public Key for VM access"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for VMs"
  type        = string
  default     = "ubuntu"
}
