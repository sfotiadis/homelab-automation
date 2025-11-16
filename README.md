# Homelab Infrastructure

Infrastructure as Code (IaC) for my homelab environment running on Proxmox VE.

## Overview

This repository contains all configuration and automation for provisioning and managing my homelab infrastructure:

- **VM Templates**: Built with Packer
- **Infrastructure**: Managed with Terraform
- **Configuration**: Automated with Ansible

## Architecture

### Infrastructure

| Component | Count | Specs | VM IDs |
|-----------|-------|-------|--------|
| DNS Server (Primary) | 1 | 2 vCPU, 2GB RAM, 20GB | 201 |
| DNS Server (Secondary) | 1 | 2 vCPU, 2GB RAM, 20GB | 202 |
| K8s Control Plane | 3 | 4 vCPU, 8GB RAM, 50GB | 301-303 |
| K8s Worker Nodes | 3 | 8 vCPU, 20GB RAM, 100GB | 311-313 |
| Load Balancer | 1 | 2 vCPU, 4GB RAM, 30GB | 305 |

**Total:** 9 VMs, 42 vCPUs, 92 GB RAM, 520 GB Storage

## Repository Structure

```
.
├── packer/                    # VM template building
│   ├── ubuntu.pkr.hcl         # Ubuntu 24.04 template configuration
│   ├── http/                  # Autoinstall configuration files
│   └── secrets.pkrvars.hcl.example
│
├── terraform/                 # Infrastructure provisioning
│   ├── modules/
│   │   └── proxmox_vm/        # Reusable VM module
│   ├── general_*              # Provider and shared variables
│   ├── dns_*                  # DNS server configuration
│   ├── k8s_*                  # Kubernetes cluster configuration
│   ├── terraform.tfvars       # Actual values (gitignored)
│   └── terraform.tfvars.example
│
└── ansible/                   # Configuration management
    ├── playbooks/             # Ansible playbooks
    ├── roles/                 # Ansible roles
    └── inventory.ini          # Ansible inventory
```

## Next Steps

- [x] Build VM template with Packer
- [x] Deploy DNS servers with Terraform
- [x] Deploy Kubernetes cluster VMs with Terraform
- [ ] Configure HAProxy load balancer
- [ ] Bootstrap Kubernetes cluster
- [ ] Install CNI (Cilium)
- [ ] Deploy MetalLB
- [ ] Configure Ingress Controller
- [ ] Set up persistent storage
