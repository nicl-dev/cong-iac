module "gke" {
  source           = "../../modules/gke"
  environment      = "dev"
  gcp_project      = "niclas-test"
  gcp_region       = "europe-west1"
  gke_cluster_name = "cong-gke-dev"
  gke_node_count   = 1
}
