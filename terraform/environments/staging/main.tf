module "gke" {
  source         = "../../modules/gke"
  environment    = "staging"
  gcp_project    = "niclas-test"
  gcp_region     = "europe-west1"
  gke_node_count = 1
}
