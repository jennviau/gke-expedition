output "ip_address" {
  value = "${google_compute_address.keycloak-static.address}"
}
