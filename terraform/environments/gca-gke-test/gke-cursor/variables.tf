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
  default     = "gke-cursor"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = "gke-cursor-net"
}

variable "subnetwork" {
  description = "Subnetwork name or self_link"
  type        = string
  default     = "gke-cursor-subnet"
}

variable "release_channel" {
  description = "Release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "description" {
  description = "Cluster description"
  type        = string
  default     = "NVIDIA H200 (141GB) ultra-accelerator cluster"
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
    "system" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    },
    "cursor-v17" = {
      machine_type       = "a3-ultragpu-8g"
      disk_size_gb       = 500
      node_count         = 1
      autoscaling        = true
      min_count          = 0
      max_count          = 4
      accelerator_type   = "nvidia-h200-141gb"
      accelerator_count  = 8
      gpu_driver_version = "DEFAULT"
    }
  }
}
