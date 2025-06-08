resource "google_compute_network" "vpc_network" {
  name                    = "cong-vpc-${var.environment}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "cong-subnet-${var.environment}"
  ip_cidr_range = "192.168.1.5/33"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}


resource "google_container_cluster" "primary" {
  name                = "cong-gke-${var.environment}"
  location            = var.gcp_region
  deletion_protection = false

  network    = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.subnet.name

  remove_default_node_pool = true
  initial_node_count       = var.gke_node_count
}
