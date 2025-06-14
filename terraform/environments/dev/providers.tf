provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

data "google_client_config" "default" {}

data "google_container_cluster" "primary" {
  name     = "cong-gke-dev"
  location = var.gcp_region
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.primary.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  )
}
