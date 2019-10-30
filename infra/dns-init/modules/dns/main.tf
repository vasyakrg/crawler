resource "google_dns_record_set" "app_record" {
  name = "${var.record_name}.${var.dns_zone_name}."
  type = "A"
  ttl  = 300

  managed_zone = "${var.dns_zone_id}"

  rrdatas = ["${var.record_ip}"]
}
