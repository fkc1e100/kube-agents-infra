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
  description = "Name of the GKE cluster"
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

variable "node_pools" {
  description = "Map of node pools to configure for this cluster"
  type = map(object({
    machine_type      = optional(string, "e2-standard-2")
    disk_size_gb      = optional(number, 100)
    disk_type         = optional(string, "pd-standard")
    node_count        = optional(number, 1)
    autoscaling       = optional(bool, false)
    min_count         = optional(number, 1)
    max_count         = optional(number, 5)
    accelerator_type   = optional(string, null)
    accelerator_count  = optional(number, 0)
    gpu_driver_version = optional(string, "DEFAULT")
  }))
  default = {}
}

resource "google_container_cluster" "primary" {
  name        = var.cluster_name
  location    = var.location
  project     = var.project_id
  description = var.description

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = length(var.node_pools) > 0 ? true : false
  initial_node_count       = 1

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  ip_allocation_policy {}

  release_channel {
    channel = var.release_channel
  }

  deletion_protection = var.deletion_protection

  lifecycle {
    ignore_changes = [
      node_config,
    ]
  }
}

resource "google_container_node_pool" "pools" {
  for_each = var.node_pools

  name       = each.key
  location   = var.location
  cluster    = google_container_cluster.primary.name
  project    = var.project_id
  node_count = each.value.autoscaling ? null : each.value.node_count

  dynamic "autoscaling" {
    for_each = each.value.autoscaling ? [1] : []
    content {
      min_node_count = each.value.min_count
      max_node_count = each.value.max_count
    }
  }

  node_config {
    machine_type = each.value.machine_type
    disk_size_gb = each.value.disk_size_gb
    disk_type    = each.value.disk_type
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

    dynamic "guest_accelerator" {
      for_each = each.value.accelerator_type != null && each.value.accelerator_count > 0 ? [1] : []
      content {
        type  = each.value.accelerator_type
        count = each.value.accelerator_count
        gpu_driver_installation_config {
          gpu_driver_version = each.value.gpu_driver_version
        }
      }
    }
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_id" {
  value = google_container_cluster.primary.id
}
