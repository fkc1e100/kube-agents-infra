variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "gca-gke-2025"
}

variable "region" {
  description = "Default GCP Region"
  type        = string
  default     = "us-east1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "openrl-gpu-hub"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "us-east1-c"
}

variable "network" {
  description = "VPC network name or self_link"
  type        = string
  default     = "gemma4-inference-vpc"
}

variable "subnetwork" {
  description = "Subnetwork name or self_link"
  type        = string
  default     = "openrl-gpu-subnet-east1"
}

variable "release_channel" {
  description = "Release channel (RAPID, REGULAR, STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "description" {
  description = "Cluster description"
  type        = string
  default     = "OpenRL reinforcement learning inference hub with NVIDIA L4 GPUs"
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
      node_count   = 2
      autoscaling  = false
    },
    "l4-gpu-pool" = {
      machine_type       = "g2-standard-16"
      disk_size_gb       = 200
      node_count         = 3
      autoscaling        = false
      accelerator_type   = "nvidia-l4"
      accelerator_count  = 1
      gpu_driver_version = "DEFAULT"
    }
  }
}
