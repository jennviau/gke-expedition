module "cluster" {
  source = "../modules/gke"

  settings = {
    project                = "${var.project_name}"
    region_name            = "${var.region}"
    cluster_node_count     = "${var.initial_node_count}"
    zone_amount            = 3
    cluster_name           = "${var.cluster_name}"
    gke_min_master_version = "1.9.7-gke.3"
    master_username        = "${var.master_username}"
    master_password        = "${var.master_password}"
    node_machine_type      = "${var.node_type}"
    node_disk_size         = "100"
    node_image_type        = "${var.image_type}"
    private_cluster        = false
  }
}

module "keycloak" {
  source = "./keycloak"
}

module "dns" {
  source = "./dns"
}
