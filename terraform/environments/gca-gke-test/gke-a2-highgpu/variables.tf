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
  default     = "gke-a2-highgpu"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "us-central1"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = "gke-a2-highgpu-net"
}

variable "subnetwork" {
  description = "Subnetwork name or self_link"
  type        = string
  default     = "gke-a2-highgpu-subnet"
}

variable "release_channel" {
  description = "Release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "description" {
  description = "Cluster description"
  type        = string
  default     = "NVIDIA A100 (40GB) training and inference cluster"
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
    "a2-highgpu-8g-a2highgpupool" = {
      machine_type       = "a2-highgpu-8g"
      disk_size_gb       = 200
      node_count         = 1
      autoscaling        = true
      min_count          = 0
      max_count          = 4
      accelerator_type   = "nvidia-tesla-a100"
      accelerator_count  = 8
      gpu_driver_version = "DEFAULT"
    }
  }
}
