terraform {
  backend "gcs" {
    bucket  = "keycloak-208622"
    path    = "/terraform/cluster/terraform.tfstate"
    project = "keycloak-208622"
  }
}
