module "gke" {
  source           = "../../modules/gke"
  environment      = "dev"
  gcp_project      = var.gcp_project
  gcp_region       = var.gcp_region
  gke_cluster_name = var.gke_cluster_name
  gke_node_count   = var.gke_node_count
}
