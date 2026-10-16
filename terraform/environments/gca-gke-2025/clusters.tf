# Clusters in gca-gke-2025

module "cluster_kcc_gitops_hub" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "kcc-gitops-hub"
  location     = "us-east1-c"
  network      = "default"
  subnetwork   = "default"
  description  = "Secondary GitOps and Config Connector management cluster"

  node_pools = {
    "patched-pool" = {
      machine_type = "e2-standard-4"
      node_count   = 3
      autoscaling  = false
    }
  }
}

module "cluster_openrl_gpu_hub" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "openrl-gpu-hub"
  location     = "us-east1-c"
  network      = module.vpc_gemma4_inference.network_name
  subnetwork   = "openrl-gpu-subnet-east1"
  description  = "OpenRL reinforcement learning inference hub with NVIDIA L4 GPUs"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-4"
      node_count   = 2
      autoscaling  = false
    }
    "l4-gpu-pool" = {
      machine_type      = "g2-standard-16"
      disk_size_gb      = 200
      accelerator_type  = "nvidia-l4"
      accelerator_count = 1
      gpu_driver_version = "DEFAULT"
      node_count        = 3
      autoscaling       = false
    }
  }
}
