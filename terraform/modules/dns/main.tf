
data "google_dns_managed_zone" "cloud" {
  name = "${var.zone_name}"
}

resource "google_dns_record_set" "service-static-ip" {
  name = "${var.record_name}.${data.google_dns_managed_zone.cloud.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.cloud.name}"

  rrdatas = ["${var.ip_address"]
}


