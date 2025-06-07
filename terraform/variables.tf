variable "gcp_project" {
  type        = string
  description = "GCP project ID"
}

variable "gcp_region" {
  type    = string
  default = "europe-west1"
}

variable "gke_cluster_name" {
  type    = string
  default = "cong-demo-cluster"
}

variable "gke_node_count" {
  type    = number
  default = 1
}
