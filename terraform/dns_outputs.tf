# DNS Server Outputs

output "dns1_ip" {
  value       = module.dns1.ip_address
  description = "IP address of DNS1"
}

output "dns2_ip" {
  value       = module.dns2.ip_address
  description = "IP address of DNS2"
}
