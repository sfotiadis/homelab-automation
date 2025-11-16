# Kubernetes Cluster Outputs

# Control Plane Outputs
output "k8s_cp_01_ip" {
  value       = module.k8s_cp_01.ip_address
  description = "IP address of Control Plane Node 1"
}

output "k8s_cp_02_ip" {
  value       = module.k8s_cp_02.ip_address
  description = "IP address of Control Plane Node 2"
}

output "k8s_cp_03_ip" {
  value       = module.k8s_cp_03.ip_address
  description = "IP address of Control Plane Node 3"
}

# Worker Outputs
output "k8s_worker_01_ip" {
  value       = module.k8s_worker_01.ip_address
  description = "IP address of Worker Node 1"
}

output "k8s_worker_02_ip" {
  value       = module.k8s_worker_02.ip_address
  description = "IP address of Worker Node 2"
}

output "k8s_worker_03_ip" {
  value       = module.k8s_worker_03.ip_address
  description = "IP address of Worker Node 3"
}

# Load Balancer Output
output "k8s_lb_ip" {
  value       = module.k8s_lb.ip_address
  description = "IP address of Load Balancer (HAProxy)"
}

# Cluster Summary
output "k8s_cluster_summary" {
  value = <<-EOT
    
    Kubernetes Cluster Deployment Summary:
    
    Control Plane Nodes:
      - k8s-cp-01: ${module.k8s_cp_01.ip_address} (VM ${var.k8s_cp_vm_ids[0]})
      - k8s-cp-02: ${module.k8s_cp_02.ip_address} (VM ${var.k8s_cp_vm_ids[1]})
      - k8s-cp-03: ${module.k8s_cp_03.ip_address} (VM ${var.k8s_cp_vm_ids[2]})
    
    Worker Nodes:
      - k8s-worker-01: ${module.k8s_worker_01.ip_address} (VM ${var.k8s_worker_vm_ids[0]})
      - k8s-worker-02: ${module.k8s_worker_02.ip_address} (VM ${var.k8s_worker_vm_ids[1]})
      - k8s-worker-03: ${module.k8s_worker_03.ip_address} (VM ${var.k8s_worker_vm_ids[2]})
    
    Load Balancer:
      - k8s-lb-01: ${module.k8s_lb.ip_address} (VM ${var.k8s_lb_vm_id})
    
    Next Steps:
    1. Configure HAProxy on ${module.k8s_lb.ip_address}
    2. Bootstrap first control plane node
    3. Join remaining control plane nodes
    4. Join worker nodes
    5. Deploy CNI (Calico/Cilium)
    6. Deploy MetalLB for LoadBalancer services
  EOT
  description = "Summary of Kubernetes cluster deployment"
}
