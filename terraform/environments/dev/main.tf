module "gke" {
  source         = "../../modules/gke"
  environment    = "dev"
  gcp_project    = var.gcp_project
  gcp_region     = var.gcp_region
  gke_node_count = 1
}

# module "namespace" {
#   source = "../../modules/k8s"
#   name   = "demo-namespace"
# }
