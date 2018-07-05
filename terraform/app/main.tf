module "keycloak" {
  source = "./keycloak"

  name_space = "keycloak"

  //Common  -- use vault for this
  db_user          = "keycloak"
  db_password      = "keycloak"
  db_instance_name = "keycloak"

  /*
    //auth
    host                   = "${module.cluster.host}"
    client_certificate     = "${module.cluster.client_certificate}"
    client_key             = "${module.cluster.client_key}"
    cluster_ca_certificate = "${module.cluster.cluster_ca_certificate}"
  */
  //keycloak vars  - Also use vault here....
  keycloak_admin_user = "admin"

  keycloak_admin_pass = "not4u2cee"
  app_name            = "keycloak"
  app_image           = "gcr.io/keycloak-208622/keycloak-ha-mysql:latest"

  // db vars
  db_name         = "mariadb"
  db_image        = "gcr.io/keycloak-208622/mariadb:10.1"
  db_service_name = "mysql"
  db_replicas     = 3

  // Service Vars
  app_service_name = "keycloak"
}

module "dns" {
  source = "./dns"

  ip_address  = "${module.keycloak.external-ip}"
  zone_name   = "automateit"
  record_name = "gke"
}
