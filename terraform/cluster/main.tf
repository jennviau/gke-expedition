variable "region" {
  default = "northamerica-northeast1" 
}


module "cluster" {
  source = "../modules/gke"

  settings = {
    region_name            = "${var.region}"
    node_number		   = 2
    zone_amount            = 3
    cluster_name           = "expedition"
    gke_min_master_version = "1.9.7-gke.3"
  }
}
