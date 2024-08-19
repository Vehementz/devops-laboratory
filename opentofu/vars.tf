
### variables.tf
variable "ct_bridge" {
  type = string
}
variable "ct_datastore_storage_location" {
  type = string
}
variable "ct_datastore_template_location" {
  type = string
}
variable "ct_disk_size" {
  type    = string
  default = "20"
}
variable "ct_nic_rate_limit" {
  type = number
}
variable "ct_memory" {
  type = number
}
variable "ct_source_file_path" {
  type = string
}
variable "dns_domain" {
  type = string
}
variable "dns_server" {
  type = string
}
variable "gateway" {
  type = string
}
variable "os_type" {
  type = string
}
variable "pve_api_token" {
  type = string
}
variable "pve_api_user" {
  type = string
}
variable "pve_host_address" {
  type = string
}
variable "tmp_dir" {
  type = string
}
variable "pve_node_name" {
  type = string
}
variable "cpu_architecture" {
  type = string
}

variable "ipv4_address" {
  type = string
}

# variable "ssh_key" {
#   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcwZAOfqf6E6p8IkrurF2vR3NccPbMlXFPaFe2+Eh/8QnQCJVTL6PKduXjXynuLziC9cubXIDzQA+4OpFYUV2u0fAkXLOXRIwgEmOrnsGAqJTqIsMC3XwGRhR9M84c4XPAX5sYpOsvZX/qwFE95GAdExCUkS3H39rpmSCnZG9AY4nPsVRlIIDP+/6YSy9KWp2YVYe5bDaMKRtwKSq3EOUhl3Mm8Ykzd35Z0Cysgm2hR2poN+EB7GD67fyi+6ohpdJHVhinHi7cQI4DUp+37nVZG4ofYFL9yRdULlHcFa9MocESvFVlVW0FCvwFKXDty6askpg9yf4FnM0OSbhgqXzD austin@EARTH"
# }

# variable "proxmox_host" {
#     default = "prox-1u"
# }

# variable "template_name" {
#     default = "ubuntu-2004-cloudinit-template"
# }

# variable "api_token" {
#   description = "Token to connect Proxmox API"
#   type = string
# }

