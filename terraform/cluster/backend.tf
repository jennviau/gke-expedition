terraform {
  backend "gcs" {
    bucket  = "keycloak-208622"
    path    = "/terraform/terraform.tfstate"
    project = "keycloak-208622"
  }
}
