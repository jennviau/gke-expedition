module "cluster" {
  source = "../modules/gke"

  settings = 
    {
    project                = "keycloak-208622}"
    region_name            = "northamerica-northeast1"
    cluster_node_count     = 2
    zone_amount            = 3
    cluster_name           = "keycloak-ha"
    gke_min_master_version = "1.9.7-gke.3"
    node_machine_type      = "COS"
    node_disk_size         = "100"
    node_image_type        = "n1-standard-1"
    private_cluster        = false
    }

module "keycloak" {
  source = "../modules/keycloak"
  //auth
  client_certificate = "${module.gke.client_certificate}"
  client_key = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
  host = 
  //keycloak vars
  name_space = "keycloak"
  app_name   = "keycloak"
  app_image  = "gcr.io/keycloak-208622/keycloak-ha-mysql:latest"

  // db vars
  db_name =   "mariadb"
  db_image = "gcr.io/keycloak-208622/mariadb:10.1"
  db_service_name = "mysql"

}

module "dns" {
  source = "../modules/dns"
  ip_address = "{$module.keycloak.ip_address}"
  static_zone = "automateit"
  static_name = "gke"
}
