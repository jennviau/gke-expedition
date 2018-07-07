module "kubernetes" {
  source                   = "../modules/gke"
  project                  = "keycloak-208622"
  region_name              = "northamerica-northeast1"
  cluster_node_count       = 1
  zone_amount              = 2
  zones                    = ["northamerica-northeast1-a", "northamerica-northeast1-b"]
  cluster_name             = "keycloak"
  gke_min_master_version   = "1.9.7-gke.3"
  node_type                = "n1-standard-1"
  disk_size                = "100"
  image_type               = "COS"
  master_password          = "${var.master_password}"
  master_username          = "${var.master_username}"
  daily_maintenance_window = "03:00"
  enable_legacy_abac       = false
}
