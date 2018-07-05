data "google_dns_managed_zone" "cloud" {
  name    = "${var.zone_name}"
  project = "keycloak-208622"
}

resource "google_dns_record_set" "service-static-ip" {
  name         = "${var.record_name}.${data.google_dns_managed_zone.cloud.dns_name}"
  type         = "A"
  ttl          = 300
  project      = "keycloak-208622"
  managed_zone = "${data.google_dns_managed_zone.cloud.name}"

  rrdatas = ["${var.ip_address}"]
}
