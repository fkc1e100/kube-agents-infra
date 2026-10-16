variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "gca-gke-test"
}

variable "region" {
  description = "Default GCP Region"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "dataproc-billing-test-cluster"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "us-central1-a"
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
  default     = "Dataproc and BigQuery billing integration test cluster"
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
      machine_type = "e2-standard-4"
      node_count   = 3
      autoscaling  = true
      min_count    = 1
      max_count    = 5
    },
    "dp-shared" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 3
    }
  }
}
