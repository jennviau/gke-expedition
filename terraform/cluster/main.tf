module "cluster" {
  source = "../modules/gke"

  settings = {
    project                = "keycloak-208622"
    region_name            = "northamerica-northeast1"
    cluster_node_count     = 2
    zone_amount            = 3
    cluster_name           = "keycloak-ha"
    gke_min_master_version = "1.9.7-gke.3"
    node_machine_type      = "n1-standard-1"
    node_disk_size         = "100"
    node_image_type        = "COS"
    private_cluster        = false
    master_password        = "${var.master_password}"
    master_username        = "${var.master_username}"
  }
}
