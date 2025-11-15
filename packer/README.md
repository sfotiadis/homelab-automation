# Packer - Ubuntu 24.04 Template

Builds an Ubuntu 24.04 LTS template for Proxmox VE with cloud-init and qemu-guest-agent pre-installed.

## Prerequisites

- Packer >= 1.14.2
- Ubuntu 24.04.3 Server ISO uploaded to Proxmox (`local:iso/ubuntu-24.04.3-live-server-amd64.iso`)
- Proxmox API token with VM management permissions

## Setup

1. Copy the example secrets file:
   ```bash
   cp secrets.pkrvars.hcl.example secrets.pkrvars.hcl
   ```

2. Edit `secrets.pkrvars.hcl` with your Proxmox credentials

## Build

```bash
# Initialize Packer plugins
packer init .

# Validate configuration
packer validate -var-file="secrets.pkrvars.hcl" .

# Build template
packer build -var-file="secrets.pkrvars.hcl" .
```

## Output

- **Template ID**: 9000
- **Template Name**: ubuntu-2404-template
- **Disk Size**: 20GB
- **Features**: Cloud-init enabled, qemu-guest-agent installed

The template is ready to be cloned with Terraform.
