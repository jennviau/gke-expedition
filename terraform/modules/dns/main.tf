
data "google_dns_managed_zone" "cloud" {
  name = "${var.static_zone}"
}

resource "google_dns_record_set" "static_ip" {
  name = "${var.static_name}.${data.google_dns_managed_zone.cloud.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${data.google_dns_managed_zone.cloud.name}"

  rrdatas = ["${var.ip_address"]
}


