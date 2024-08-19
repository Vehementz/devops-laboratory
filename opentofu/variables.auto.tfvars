### variables.auto.tfvars

# NM = No modified
# Crt = corrected
ct_bridge                      = "vmbr2" # Crt
ct_datastore_storage_location  = "local-hdd-templates"
ct_datastore_template_location = "local-hdd-templates:ubuntu-22.04-1_amd64.tar.zst"
ct_disk_size                   = "8"
ct_nic_rate_limit              = 10 # NM
ct_memory                      = 512 # Crt
ct_source_file_path            = "http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst"
dns_domain                     = "domain.net"
dns_server                     = "192.168.1.1"
gateway                        = "192.168.1.1"
os_type                        = "debian"
pve_api_token                  = "terrabot@pve!tf=change-my-token"
pve_api_user                   = "terrabot"
pve_host_address               = "https://192.168.1.2:8006"
tmp_dir                        = "/var/tmp"
