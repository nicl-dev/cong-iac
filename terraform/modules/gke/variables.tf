variable "gcp_project" {
  type        = string
  description = "GCP project ID"
}

variable "gcp_region" {
  type    = string
  default = "europe-west1"
}

variable "gke_cluster_name" {
  type        = string
  description = "GKE cluster name"
}

variable "gke_node_count" {
  type    = number
  default = 1
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}
