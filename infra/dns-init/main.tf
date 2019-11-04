terraform {
  # Версия terraform  # required_version = ">=0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.11.0"

  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

provider "kubernetes" {

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

module "dns-registry" {
  source        = "./modules/dns"
  dns_zone_id   = "tfm"
  dns_zone_name = "tfm.zone"
  record_name   = "registry"
  record_ip     = "${data.kubernetes_service.nginx.load_balancer_ingress.0.ip}"
}

module "dns-crawler" {
  source        = "./modules/dns"
  dns_zone_id   = "tfm"
  dns_zone_name = "tfm.zone"
  record_name   = "crawler"
  record_ip     = "${data.kubernetes_service.nginx.load_balancer_ingress.0.ip}"
}

module "dns-prometet" {
  source        = "./modules/dns"
  dns_zone_id   = "tfm"
  dns_zone_name = "tfm.zone"
  record_name   = "prometheus"
  record_ip     = "${data.kubernetes_service.nginx.load_balancer_ingress.0.ip}"
}

