output "registered_ip_address" {
  value = "${google_compute_address.service-static-ip.address}"
}
