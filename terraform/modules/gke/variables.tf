variable "gcp_region" {
  type    = string
  default = "europe-west1"
}

variable "gke_node_count" {
  type    = number
  default = 1
}

variable "environment" {
  description = "Environment name (e.g. dev, staging, prod)"
  type        = string
}
