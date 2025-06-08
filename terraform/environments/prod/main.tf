module "gke" {
  source           = "../../modules/gke"
  environment      = "prod"
  gcp_project      = "niclas-test"
  gcp_region       = "europe-west1"
  gke_cluster_name = "cong-gke-prod"
  gke_node_count   = 1

}
