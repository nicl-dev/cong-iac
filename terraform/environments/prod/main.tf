module "gke" {
  source         = "../../modules/gke"
  environment    = "prod"
  gcp_project    = "niclas-test"
  gcp_region     = "europe-west1"
  gke_node_count = 1

}
