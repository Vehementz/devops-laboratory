### container.tf
# see https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password.html. It will download "hashicorp/random" provider
resource "random_password" "container_root_password" {
  length           = 24
  override_special = "_%@"
  special          = true
}

output "container_root_password" {
  value     = random_password.container_root_password.result
  sensitive = true
}

# location of containers templates
resource "proxmox_virtual_environment_file" "debian_container_template" {
  content_type = "vztmpl" #  The content_type is set to "vztmpl" indicating it's a virtual machine or container template. This file is fetched from a specific datastore and node as defined by the variables ct_datastore_template_location and node_name.
  datastore_id = var.ct_datastore_template_location
  node_name    = var.pve_node_name

  source_file {
    path = var.ct_source_file_path
  }
}

resource "proxmox_virtual_environment_container" "debian_container" {
  description   = "Managed by Terraform"
  node_name     = var.pve_node_name
  start_on_boot = true # Boots automatically with the system (start_on_boot = true).
  tags          = ["linux", "infra"]
  unprivileged  = true # Runs unprivileged, enhancing security.
  vm_id         = 241001  

  cpu {
    architecture = var.cpu_architecture # Includes a CPU setup for an AMD64 architecture with one core.
    cores        = 1
  }

  disk {
    datastore_id = var.ct_datastore_storage_location
    size         = var.ct_disk_size
  }

  memory {
    dedicated = var.ct_memory
    swap      = 0
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_file.debian_container_template.id # Uses the Debian template file from the earlier defined 
    type             = var.os_type
  }

  initialization {
    hostname = "ct-example"

    dns {
      domain = var.dns_domain
      server = var.dns_server
    }

    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.gateway
      }
    }
    # user_account { # Sets up a user account with SSH public key access and the generated password from the random_password resource.
    #   keys     = ["put-your-ssh-pubkey-here"]
    #   password = random_password.container_root_password.result
    # }
  }
  network_interface { # Configures a network interface with specified bridging and rate limits.
    name       = var.ct_bridge # that likely specifies the network bridge this container will connect to. 
    rate_limit = var.ct_nic_rate_limit 
  }

  features {
    nesting = true
    fuse    = false
  }
}