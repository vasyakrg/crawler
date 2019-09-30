terraform {
  backend "gcs" {
    bucket = "otus-crawler"
    prefix = "cluster-1"
  }
}
