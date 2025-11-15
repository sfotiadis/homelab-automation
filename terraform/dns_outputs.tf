# DNS Server Outputs

output "dns1_ip" {
  value       = var.dns1_ip
  description = "IP address of DNS1"
}

output "dns2_ip" {
  value       = var.dns2_ip
  description = "IP address of DNS2"
}
