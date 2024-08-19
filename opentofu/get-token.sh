#! /bin/bash
pveum user token add terraform-prov@pve terraform -expire 0 -privsep 0 -comment "Terraform token"

# vault login [Your Vault Root Token]
# vault kv put secret/proxmox credentials='{"username":"root@pam", "password":"your_password"}'

# export TF_VAR_api_token="terraform-prov@pve\!terraform=159ae6b8-8d5e-4be0-af1f-7490b70989e"

# export PROXMOX_VE_USERNAME="username@realm"
# export PROXMOX_VE_PASSWORD="a-strong-password"

# export PM_USER="terraform-prov@pve"
# export PM_PASS="password"
