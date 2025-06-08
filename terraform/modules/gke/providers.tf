provider "google" {
  credentials = file("gcp-key.json")
  project     = var.gcp_project
  region      = var.gcp_region
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = google_container_cluster.primary.endpoint
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  )
}
