data "google_compute_zones" "available" {}

resource "google_container_cluster" "cluster" {
  lifecycle {
    ignore_changes = ["node_pool"]
  }

  name               = "${local.merged_settings["cluster_name"]}"
  region             = "${local.merged_settings["region_name"]}"
  initial_node_count = "${local.merged_settings["cluster_node_count"]}"
  min_master_version = "${local.merged_settings["gke_min_master_version"]}"
  enable_legacy_abac = "${local.merged_settings["enable_legacy_abac"]}"

  master_auth {
    username = "${local.merged_settings["master_username"]}"
    password = "${local.merged_settings["master_password"]}"
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${local.merged_settings["daily_maintenance_window"]}"
    }
  }

  node_config {
    machine_type = "${local.merged_settings["node_machine_type"]}"
    disk_size_gb = "${local.merged_settings["node_disk_size"]}"
    image_type   = "${local.merged_settings["node_image_type"]}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  addons_config {
    http_load_balancing {
      disabled = "${local.merged_settings["http_load_balancing"] == true ? false : true}"
    }
  }
}
