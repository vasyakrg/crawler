terraform {
  backend "gcs" {
    bucket = "otus-crawler"
    prefix = "git-dns"
  }
}
