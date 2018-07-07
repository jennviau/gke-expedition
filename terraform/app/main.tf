module "keycloak" {
  source = "../modules/keycloak"

  name_space   = "keycloak"
  project_name = "keycloak-208622"
  region       = "northamerica-northeast1"

  //Common  -- use vault for this
  db_user          = "keycloak"
  db_password      = "keycloak"
  db_instance_name = "keycloak"

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
  db_volume_name  = "mysql-datadir"
  db_volume_size  = "5"

  // Service Vars
  app_service_name = "keycloak"
}

module "static" {
  source = "../modules/dns"

  ip_address  = "${module.keycloak.external-ip}"
  zone_name   = "automateit"
  record_name = "gke"
}
