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
  default     = "kcc-gitops-hub"
}

variable "location" {
  description = "GCP Region or Zone for the cluster"
  type        = string
  default     = "us-east1-c"
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
  default     = "Secondary GitOps and Config Connector management cluster"
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
    "patched-pool" = {
      machine_type = "e2-standard-4"
      node_count   = 3
      autoscaling  = false
    }
  }
}
