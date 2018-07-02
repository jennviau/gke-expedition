variable "settings" {
  default = {}
}

locals {
  default_settings = {
    daily_maintenance_window = "03:00"
    enable_legacy_abac       = false
  }

  merged_settings = "${merge(local.default_settings, var.settings)}"
}
