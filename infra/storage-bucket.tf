provider "google" {
  version = "2.11.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "storage-bucket" {
  source    = "git::https://github.com/SweetOps/terraform-google-storage-bucket.git?ref=master"
  namespace = "otus-crawler"
  location  = "${var.region}"

  force_destroy = "true"
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}
