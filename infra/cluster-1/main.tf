terraform {
  # Версия terraform
  required_version = ">=0.11.11"
}

provider "google" {
  # Версия провайдера
  version = "2.11.0"

  credentials = "${file("~/.config/gcloud/vasya-k8s-1139ce55674f.json")}"

  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_project_service" "k8s" {
  project = "${var.project}"
  service = "container.googleapis.com"
}

resource "google_container_cluster" "k8s" {
  name       = "cluster-1"
  location   = "${var.zone}"
  depends_on = ["google_project_service.k8s"]

  initial_node_count = "${var.num_nodes}"

  enable_legacy_abac = "true"

  master_auth {
    username = "${var.master_auth_username}"
    password = "${var.master_auth_password}"
  }

  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 50

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    tags = ["network-cluster"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_container_node_pool" "service-pool" {
  name               = "mon-pool"
  location           = "${var.zone}"
  cluster            = "${google_container_cluster.k8s.name}"
  initial_node_count = 1
}

# module "dns" {
#   source        = "../modules/dns"
#   dns_zone_id   = "tfm"
#   dns_zone_name = "tfm.zone"
#   record_name   = "cluster-1.k8s"
#   record_ip     = "${google_container_cluster}"
# }

