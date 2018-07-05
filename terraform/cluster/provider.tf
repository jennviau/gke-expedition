provider "google" {
  project     = "${var.project_name}"
  region      = "${var.region}"
  credentials = "${file("../terraform-admin.json")}"
}

provider "kubernetes" {
  client_certificate     = "${base64decode(var.client_certificate)}"
  client_key             = "${base64decode(var.client_key)}"
  cluster_ca_certificate = "${base64decode(var.cluster_ca_certificate)}"
}
