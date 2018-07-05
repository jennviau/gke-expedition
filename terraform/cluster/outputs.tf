data "google_container_cluster" "keycloak-ha" {
  name   = "keycloak-ha"
  region = "northamerica-northeast1"
}

output "cluster_name" {
  value = "${data.google_container_cluster.keycloak-ha.name}"
}

output "cluster_zone" {
  value = "${data.google_container_cluster.keycloak-ha.region}"
}

output "client_certificate" {
  value     = "${data.google_container_cluster.keycloak-ha.master_auth.0.client_certificate}"
  sensitive = true
}

output "client_key" {
  value     = "${data.google_container_cluster.keycloak-ha.master_auth.0.client_key}"
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = "${data.google_container_cluster.keycloak-ha.master_auth.0.cluster_ca_certificate}"
  sensitive = true
}

output "host" {
  value     = "${data.google_container_cluster.keycloak-ha.endpoint}"
  sensitive = true
}