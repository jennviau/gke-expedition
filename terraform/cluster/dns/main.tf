resource "google_compute_address" "keycloak-static" {
  name = "${var.static_name}"
}

data "google_dns_managed_zone" "cloud" {
  name = "${var.static_zone}"
}

resource "google_dns_record_set" "keycloak-static" {
  name = "gke.${data.google_dns_managed_zone.cloud.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.cloud.name}"

  rrdatas = ["${google_compute_address.keycloak-static.address}"]
}

//TO-DO PTR Record handler

