
# # resource is formatted to be "[type]" "[entity_name]" so in this case
# # we are looking to create a proxmox_vm_qemu entity named test_server
# resource "proxmox_vm_qemu" "test_server" {
#   count = 1 # just want 1 for now, set to 0 and apply to destroy VM
#   name = "test-vm-${count.index + 1}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
#   # this now reaches out to the vars file. I could've also used this var above in the pm_api_url setting but wanted to spell it out up there. target_node is different than api_url. target_node is which node hosts the template and thus also which node will host the new VM. it can be different than the host you use to communicate with the API. the variable contains the contents "prox-1u"
#   target_node = var.proxmox_host
#   # another variable with contents "ubuntu-2004-cloudinit-template"
#   clone = var.template_name
#   # basic VM settings here. agent refers to guest agent
#   agent = 1
#   os_type = "cloud-init"
#   cores = 2
#   sockets = 1
#   cpu = "host"
#   memory = 2048
#   scsihw = "virtio-scsi-pci"
#   bootdisk = "scsi0"
#   disk {
#     slot = 0
#     # set disk size here. leave it small for testing because expanding the disk takes time.
#     size = "10G"
#     type = "scsi"
#     storage = "local-zfs"
#     iothread = 1
#   }
  
#   # if you want two NICs, just copy this whole network section and duplicate it
#   network {
#     model = "virtio"
#     bridge = "vmbr0"
#   }
#   # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
#   lifecycle {
#     ignore_changes = [
#       network,
#     ]
#   }
  
#   # the ${count.index + 1} thing appends text to the end of the ip address
#   # in this case, since we are only adding a single VM, the IP will
#   # be 10.98.1.91 since count.index starts at 0. this is how you can create
#   # multiple VMs and have an IP assigned to each (.91, .92, .93, etc.)
#   ipconfig0 = "ip=10.98.1.9${count.index + 1}/24,gw=10.98.1.1"
  
#   # sshkeys set using variables. the variable contains the text of the key.
#   sshkeys = <<EOF
#   ${var.ssh_key}
#   EOF
# }

### provider.tf
# terraform {
#   required_providers {
#     proxmox = {
#       source = "bpg/proxmox"
#       version = "0.62.0"
#     }
#   }
# }

# provider "proxmox" {
#   endpoint  = var.pve_host_address
#   username = var.pve_api_user
#   password = var.pve_password
#   # api_token = var.pve_api_token
#   insecure  = true
#   ssh {
#     agent    = true
#     # username = var.pve_api_user
#   }
#   tmp_dir = var.tmp_dir
# }

# provider "proxmox" {
#   endpoint  = var.pve_host_address
#   api_token = var.pve_api_token
#   insecure  = true
#   ssh {
#     agent    = true
#     username = var.pve_api_user
#   }
#   tmp_dir = var.tmp_dir
# }

# ## Second option
# provider "proxmox" {
#   endpoint = ""
#   username = ""
#   password = ""
#   insecure = true


#   ssh {
#     agent       = false
#     username = "terraform"
#     # private_key = file("~/.ssh/id_rsa")
#   }

# }

#   pm_api_url      = "https://wcs-cyber-node01.v6.rocks:8006/api2/json"
#   pm_user         = ""
#   pm_password     = ""
#   pm_tls_insecure = true
#   pm_user         = ""




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




