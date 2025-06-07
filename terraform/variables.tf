variable "gcp_project" {
  description = "Google Cloud project ID"
  type        = string
}

variable "gcp_region" {
  description = "Region to deploy resources in"
  type        = string
  default     = "europe-west1"
}
