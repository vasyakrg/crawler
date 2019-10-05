terraform {
  # Версия terraform  # required_version = ">=0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.11.0"

  credentials = "${file("~/.config/gcloud/vasya-k8s-1139ce55674f.json")}"

  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

data "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "nginx-ingress"
  }
}

module "dns" {
  source        = "./modules/dns"
  dns_zone_id   = "tfm"
  dns_zone_name = "tfm.zone"
  record_name   = "gitlab"
  record_ip     = "${data.kubernetes_service.nginx.load_balancer_ingress.0.ip}"
}
