resource "google_container_cluster" "primary" {
  name     = var.gke_cluster_name
  location = var.gcp_region

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.primary.name
  location = var.gcp_region

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = var.gke_node_count
}

resource "kubernetes_namespace" "demo" {
  metadata {
    name = "demo-namespace"
    labels = {
      environment = "ci-cd"
    }
  }
}
