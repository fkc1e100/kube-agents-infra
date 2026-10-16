variable "project_id" {
  description = "GCP Project ID for gca-gke-test"
  type        = string
  default     = "gca-gke-test"
}

variable "region" {
  description = "Default GCP Region"
  type        = string
  default     = "us-central1"
}
