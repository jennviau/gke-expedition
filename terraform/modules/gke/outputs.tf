output "cluster_name" {
  value = "${google_container_cluster.cluster.name}"
}

output "cluster_zone" {
  value = "${google_container_cluster.cluster.zone}"
}
output "client_certificate" {
  value     = "${google_container_cluster.keycloak-ha.master_auth.0.client_certificate}"
  sensitive = true
}

output "client_key" {
  value     = "${google_container_cluster.keycloak-ha.master_auth.0.client_key}"
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = "${google_container_cluster.keycloak-ha.master_auth.0.cluster_ca_certificate}"
  sensitive = true
}

output "host" {
  value     = "${google_container_cluster.keycloak-ha.endpoint}"
  sensitive = true