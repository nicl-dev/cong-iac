resource "google_compute_network" "vpc_network" {
  name                    = "cong-vpc-${var.environment}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "cong-subnet-${var.environment}"
  ip_cidr_range = "10.10.0.0/16"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id

  secondary_ip_range {
    range_name    = "cong-pods-${var.environment}"
    ip_cidr_range = "10.20.0.0/16"
  }

  secondary_ip_range {
    range_name    = "cong-services-${var.environment}"
    ip_cidr_range = "10.30.0.0/16"
  }
}

resource "google_container_cluster" "primary" {
  name                = "cong-gke-${var.environment}"
  location            = var.gcp_region
  deletion_protection = false

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = "cong-pods-${var.environment}"
    services_secondary_range_name = "cong-services-${var.environment}"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
  }

}

resource "google_container_node_pool" "main" {
  name     = "cong-nodepool-${var.environment}"
  cluster  = google_container_cluster.primary.name
  location = var.gcp_region

  node_config {
    machine_type = "e2-medium"
    disk_type    = "pd-standard"
    disk_size_gb = 20
  }

  initial_node_count = var.gke_node_count
}
