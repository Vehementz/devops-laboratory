#! /bin/bash
pveum user token add terraform-prov@pve terraform -expire 0 -privsep 0 -comment "Terraform token"

vault login [Your Vault Root Token]
vault kv put secret/proxmox credentials='{"username":"root@pam", "password":"your_password"}'

