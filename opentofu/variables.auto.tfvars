### variables.auto.tfvars

# NM = No modified
# Crt = corrected

# Network Configuration
dns_domain                     = "domain.net"                  # Domain for DNS configuration
dns_server                     = "192.168.1.1"                 # DNS server IP
gateway                        = "192.168.1.1"                 # Default network gateway
ipv4_address                   = "192.168.122/24"              # Static IP address for the container
ct_bridge                      =  "vmbr0"  # "vmbr2"                       # Network bridge for container connectivity

# Storage and File Locations
ct_datastore_storage_location  = "local"         # Local config - Storage location for container data
# ct_datastore_storage_location  = "local-hdd-templates"         # Storage location for container data
ct_datastore_template_location = "local"
# ct_datastore_template_location = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Template file location and name
# ct_source_file_path            = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zs" # Source file URL for the container image
ct_source_file_path            = "http://download.proxmox.com/images/system/ubuntu-22.04-standard_22.04-1_amd64.tar.zst" # Source file URL for the container image

# Container Specifications
ct_disk_size                   = "20"                           # Disk size for the container in GB
ct_memory                      = 1024                           # RAM allocated to the container in MB
ct_nic_rate_limit              = 10                            # NIC rate limit in MB/s
os_type                        = "ubuntu" # "debian"                      # Operating system type for the container
cpu_cores                      = 1
swap_config                    = 400
# Proxmox VE Configuration
pve_api_token                  = "terrabot@pve!tf=2cf15b8e9eea9" # API token for Proxmox server authentication
pve_api_user                   = "terrabot"                    # API user for Proxmox server
pve_host_address               = "https://192.168.122.14:8006/"    # Proxmox VE API access address
pve_node_name                  = "pve"                        # Node name in the Proxmox cluster
pve_password                   = ""

# System and Miscellaneous Settings
cpu_architecture               = "amd64"                       # CPU architecture for the container
tmp_dir                        = "/var/tmp"                    # Temporary directory for system files
