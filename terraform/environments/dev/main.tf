module "gke" {
  source         = "../../modules/gke"
  environment    = "dev"
  gcp_project    = "niclas-test"
  gcp_region     = "europe-west1"
  gke_node_count = 1
# }

# module "namespace" {
#   source = "../../modules/k8s"
#   name   = "demo-namespace"
# }
