terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.30"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

variable "project_id" {
  type    = string
  default = "gca-gke-test"
}

variable "region" {
  type    = string
  default = "us-central1"
}

# Declarative reference to existing fleet clusters in gca-gke-test
locals {
  core_clusters = [
    "ka-webconsole-pr2321",
    "kcc-management-cluster",
    "simple-app-cluster",
    "gke-a2-ultra"
  ]
}

output "fleet_core_clusters" {
  description = "Core management, accelerator, and application clusters in the fleet"
  value       = locals.core_clusters
}
