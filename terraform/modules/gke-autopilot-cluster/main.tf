terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.30"
    }
  }
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE Autopilot cluster"
  type        = string
}

variable "location" {
  description = "GCP Region or Zone"
  type        = string
}

variable "network" {
  description = "VPC Network name or self_link"
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
  default     = "Managed by kube-agents GitOps"
}

variable "deletion_protection" {
  description = "Whether to prevent cluster deletion via Terraform"
  type        = bool
  default     = false
}

resource "google_container_cluster" "autopilot" {
  name        = var.cluster_name
  location    = var.location
  project     = var.project_id
  description = var.description

  network    = var.network
  subnetwork = var.subnetwork

  enable_autopilot = true

  ip_allocation_policy {}

  release_channel {
    channel = var.release_channel
  }

  deletion_protection = var.deletion_protection
}

output "cluster_name" {
  value = google_container_cluster.autopilot.name
}

output "cluster_endpoint" {
  value = google_container_cluster.autopilot.endpoint
}

output "cluster_id" {
  value = google_container_cluster.autopilot.id
}
