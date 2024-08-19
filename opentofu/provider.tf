### provider.tf
terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.41.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_host_address
  api_token = var.pve_api_token
  insecure  = true
  ssh {
    agent    = true
    username = var.pve_api_user
  }
  tmp_dir = var.tmp_dir
}

## Second option
provider "proxmox" {
  endpoint = "https://10.0.0.2:8006/"
  username = "username@realm"
  password = "the-password-set-during-installation-of-proxmox-ve"
  insecure = true

#   pm_api_url      = "https://wcs-cyber-node01.v6.rocks:8006/api2/json"
#   pm_user         = ""
#   pm_password     = ""
#   pm_tls_insecure = true
#   pm_user         = ""

# 
  ssh {
    agent       = false
    username = "terraform"
    private_key = file("~/.ssh/id_rsa")
  }

}

# provider "proxmox" {
#   # url is the hostname (FQDN if you have one) for the proxmox host you'd like to connect to to issue the commands. my proxmox host is 'prox-1u'. Add /api2/json at the end for the API
#   pm_api_url = "https://prox-1u:8006/api2/json"
#   # api token id is in the form of: <username>@pam!<tokenId>
#   pm_api_token_id = "blog_example@pam!new_token_id"
#   # this is the full secret wrapped in quotes. don't worry, I've already deleted this from my proxmox cluster by the time you read this post
#   pm_api_token_secret = "9ec8e608-d834-4ce5-91d2-15dd59f9a8c1"
#   # leave tls_insecure set to true unless you have your proxmox SSL certificate situation fully sorted out (if you do, you will know)
#   pm_tls_insecure = true
# }


provider "proxmox" {
  endpoint  = var.pve_host_address
  api_token = var.pve_api_token
  insecure  = true
  ssh {
    agent    = true
    username = var.pve_api_user
  }
  tmp_dir = var.tmp_dir
}


# resource "proxmox_lxc" "debian_lxc_container" {
#   node      = "pve-node"
#   vmid      = 220
#   pool      = "ASD-202402"
#   hostname  = "debian12-container"
#   password  = "secretpassword"
#   target_node = "pve" # node of your cluster on which deployment should be done
#   cores = 1
#   memory = 1012
#   swap   = 1048
#   unprivileged = true
# #   Explaination of the code below : Storage : local-hdd-templates - Template : debian-12-standart_12_amd64.tar.zst 
#   ostemplate = "local-hdd-templates:vztmpl/ubuntu-22.04-1_amd64.tar.zst"
# #   ostemplate = "local:debian-12-standart_12_amd64.tar.zst"
# #   ostemplate = "ubuntu-22.04-1_amd64.tar.zst"

# #   ssh_public_keys = <<-EOT
# #     ssh-rsa <public_key_1> user@example.com
# #     ssh-ed25519 <public_key_2> user@example.com
# #   EOT

# #   features {
# #     fuse    = true
# #     nesting = true
# #     mount   = "nfs;cifs"
# #   }

# #   rootfs { ### Root file system
# #     storage = "local-nvme-datas"
# #     size    = "8G"
# #   }

#   mountpoint {
#     slot    = "0"
#     storage = "/mnt/host/nfs"
#     mp      = "/mnt/container/nfs"
#     size    = "250G"
#   }

#   network {
#     name    = "eth0"
#     bridge  = var.ct_bridge
#     ip      = "dhcp"
#     # ip6    = "dhcp"
#   }

# #   start = true # start after creation
  
#     # Additional configuration for startup script

# #   features {
# #     keyctl = true
# #     nesting = true
# #   }

# #   # Script to apply firewall rules, runs at container startup, can be replaced with an other port
# #   onboot = 1
# #   startup_script = <<-EOF
# # #!/bin/bash
# # iptables -A INPUT -i eth0 -p tcp --dport 800 -j ACCEPT
# # EOF
# # }

