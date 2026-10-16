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

module "vpc_gke_a2_highgpu" {
  source       = "../../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "gke-a2-highgpu-net"
  subnets = [
    {
      name          = "gke-a2-highgpu-subnet"
      ip_cidr_range = "10.10.0.0/20"
      region        = "us-central1"
    }
  ]
}

module "vpc_gke_a2_ultra" {
  source       = "../../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "gke-a2-ultra-net"
  subnets = [
    {
      name          = "gke-a2-ultra-subnet"
      ip_cidr_range = "10.20.0.0/20"
      region        = "us-central1"
    }
  ]
}

module "vpc_gke_a3_mega" {
  source       = "../../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "gke-a3-mega-net"
  subnets = [
    {
      name          = "gke-a3-mega-subnet"
      ip_cidr_range = "10.30.0.0/20"
      region        = "us-central1"
    }
  ]
}

module "vpc_gke_cursor" {
  source       = "../../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "gke-cursor-net"
  subnets = [
    {
      name          = "gke-cursor-subnet"
      ip_cidr_range = "10.40.0.0/20"
      region        = "us-central1"
    }
  ]
}

module "vpc_slm_training" {
  source       = "../../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "slm-training-net"
  subnets = [
    {
      name          = "gke-tpuv6-dws-subnet"
      ip_cidr_range = "10.50.0.0/20"
      region        = "us-west4"
    }
  ]
}
