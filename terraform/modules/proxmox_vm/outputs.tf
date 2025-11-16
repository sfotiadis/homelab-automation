# Proxmox VM Module Outputs

output "vm_id" {
  description = "The Proxmox VM ID"
  value       = proxmox_vm_qemu.vm.id
}

output "vm_name" {
  description = "The VM name"
  value       = var.vm_name
}

output "ip_address" {
  description = "The static IP address of the VM"
  value       = var.ip_address
}
