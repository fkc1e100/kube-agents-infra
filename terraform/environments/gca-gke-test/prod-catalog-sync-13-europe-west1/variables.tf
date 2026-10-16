variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "gca-gke-test"
}

variable "region" {
  description = "Default GCP Region"
  type        = string
  default     = "europe-west1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "prod-catalog-sync-13"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "europe-west1-c"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnetwork name or self_link"
  type        = string
  default     = "default"
}

variable "release_channel" {
  description = "Release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "description" {
  description = "Cluster description"
  type        = string
  default     = "Production Catalog Synchronization - EMEA West"
}

variable "deletion_protection" {
  description = "Whether to prevent cluster deletion via Terraform"
  type        = bool
  default     = false
}

variable "node_pools" {
  description = "Node pools configuration map"
  type        = any
  default = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}
