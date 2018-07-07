terraform {
  backend "gcs" {
    bucket  = "keycloak-208622"
    path    = "/terraform/app/terraform.tfstate"
    project = "keycloak-208622"
  }
}
