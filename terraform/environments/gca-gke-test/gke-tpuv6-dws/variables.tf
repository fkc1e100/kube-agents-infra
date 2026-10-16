variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "gca-gke-test"
}

variable "region" {
  description = "Default GCP Region"
  type        = string
  default     = "us-west4"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-tpuv6-dws"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "us-west4"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = "slm-training-net"
}

variable "subnetwork" {
  description = "Subnetwork name or self_link"
  type        = string
  default     = "gke-tpuv6-dws-subnet"
}

variable "release_channel" {
  description = "Release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "description" {
  description = "Cluster description"
  type        = string
  default     = "Google Cloud TPU v6e Trillium Dynamic Workload Scheduler cluster"
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
    "system-pool" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    },
    "tpu-v6-pool" = {
      machine_type = "ct5lp-hightpu-4t"
      node_count   = 1
      autoscaling  = false
    }
  }
}
