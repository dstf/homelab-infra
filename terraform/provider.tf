terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://${var.pm_host}:8006/api2/json"
  pm_api_token_id = var.token_id
  pm_api_token_secret = var.token_secret
#  pm_user         = var.pm_user
#  pm_password     = var.pm_password
  pm_tls_insecure = true # Change to false if needed

  pm_parallel     = 10
  pm_timeout      = 600
  pm_debug = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

