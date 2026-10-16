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

module "cluster" {
  source              = "../../../modules/gke-autopilot-cluster"
  project_id          = var.project_id
  cluster_name        = var.cluster_name
  location            = var.location
  network             = var.network
  subnetwork          = var.subnetwork
  release_channel     = var.release_channel
  description         = var.description
  deletion_protection = var.deletion_protection
}
