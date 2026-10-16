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

module "vpc_gemma4_inference" {
  source       = "../../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "gemma4-inference-vpc"
  subnets = [
    {
      name          = "openrl-gpu-subnet-east1"
      ip_cidr_range = "10.60.0.0/20"
      region        = "us-east1"
    }
  ]
}
