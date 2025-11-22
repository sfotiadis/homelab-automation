# Generate Ansible Inventory from Terraform State
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tftpl", {
    dns_servers = {
      dns1 = module.dns1.ip_address
      dns2 = module.dns2.ip_address
    }
    k8s_lb = {
      "k8s-lb-01" = module.k8s_lb.ip_address
    }
    k8s_control_plane = {
      "k8s-cp-01" = module.k8s_cp_01.ip_address
      "k8s-cp-02" = module.k8s_cp_02.ip_address
      "k8s-cp-03" = module.k8s_cp_03.ip_address
    }
    k8s_workers = {
      "k8s-worker-01" = module.k8s_worker_01.ip_address
      "k8s-worker-02" = module.k8s_worker_02.ip_address
      "k8s-worker-03" = module.k8s_worker_03.ip_address
    }
  })
  filename        = "${path.module}/../ansible/inventory.ini"
  file_permission = "0644"
}