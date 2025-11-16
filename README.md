# Homelab Infrastructure

Infrastructure as Code (IaC) for my homelab environment running on Proxmox VE.

## Overview

This repository contains all configuration and automation for provisioning and managing my homelab infrastructure:

- **VM Templates**: Built with Packer
- **Infrastructure**: Managed with Terraform
- **Configuration**: Automated with Ansible

## Architecture

### Current Infrastructure

| Component | Count | Specs |
|-----------|-------|-------|
| DNS Server (Primary) | 1 | 2 vCPU, 2GB RAM, 20GB |
| DNS Server (Secondary) | 1 | 2 vCPU, 2GB RAM, 20GB |

### Planned Infrastructure

| Component | Count | Specs | Purpose |
|-----------|-------|-------|---------|
| K8s Control Plane | 3 | 4 vCPU, 8GB RAM, 50GB | Kubernetes masters |
| K8s Worker Nodes | 3 | 8 vCPU, 20GB RAM, 100GB | Application workloads |
| Load Balancer | 1 | 2 vCPU, 4GB RAM, 30GB | HAProxy for K8s API |

## Repository Structure

```
.
├── packer/              # VM template building
│   ├── ubuntu.pkr.hcl   # Ubuntu 24.04 template configuration
│   └── http/            # Autoinstall configuration files
│
├── terraform/           # Infrastructure provisioning
│   ├── general_*        # Provider and shared variables
│   ├── dns_*            # DNS server configuration
│   └── *.tfvars.example # Configuration templates
│
└── ansible/             # Configuration management
    ├── playbooks/       # Ansible playbooks
    └── roles/           # Ansible roles
```
