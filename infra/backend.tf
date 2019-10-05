terraform {
  backend "gcs" {
    bucket = "otus-crawler"
    prefix = "backend"
  }
}
