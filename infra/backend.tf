terraform {
  required_version = ">=0.11.11"

  backend "gcs" {
    bucket = "otus-crawler"
    prefix = "backend"
  }
}
