resource "google_container_cluster" "cluster" {
  name               = "${var.cluster_name}"
  region             = "${var.region_name}"
  additional_zones   = "${var.zones}"
  initial_node_count = "${var.cluster_node_count}"
  min_master_version = "${var.gke_min_master_version}"
  enable_legacy_abac = "${var.enable_legacy_abac}"

  master_auth {
    username = "${var.master_username}"
    password = "${var.master_password}"
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.daily_maintenance_window}"
    }
  }

  node_config {
    machine_type = "${var.node_type}"
    disk_size_gb = "${var.disk_size}"
    image_type   = "${var.image_type}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
