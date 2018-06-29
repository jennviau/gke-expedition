data "google_compute_zones" "available" {
  region = "${local.merged_settings["region_name"]}"
  status = "UP"
}

locals {
  additional_zone_names = "${slice(data.google_compute_zones.available.names, 1, local.merged_settings["zone_amount"])}"
}

resource "google_container_cluster" "cluster" {
  lifecycle {
    ignore_changes = ["node_pool"]
  }

  name    		= "${local.merged_settings["cluster_name"]}"
  region  		= "${local.merged_settings["region_name"]}"
  initial_node_count   = "${local.merged_settings["node_number"]}"

  addons_config {
    #   horizontal_pod_autoscaling (default: enabled)

    http_load_balancing {
      disabled = "${local.merged_settings["http_load_balancing"] == true ? false : true}"
    }

    #   kubernetes_dashboard (default: enabled)
  }

  # cluster_ipv4_cidr
  # description
  # enable_kubernetes_alpha
  enable_legacy_abac = "${local.merged_settings["enable_legacy_abac"]}"

  # initial_node_count (deprecated)
  # ip_allocation_policy {
  #  cluster_secondary_range_name
  #  services_secondary_range_name
  #}
  # logging_service
  maintenance_policy {
    daily_maintenance_window {
      start_time = "${local.merged_settings["daily_maintenance_window"]}"
    }
  }

  # master_auth {
  #   password
  #   username
  #}
  # master_authorized_networks_config {
  #   cidr_blocks
  #     cidr_block
  #     display_name
  #}
  min_master_version = "${local.merged_settings["gke_min_master_version"]}"

  # monitoring_service
  # network
  # network_policy {
  #   provider
  #   enabled
  #}
  # node_config (node_pool overrides)
  #node_pool = {}

  # node_version (node_pool overrides)
  # project
  # subnetwork
}
