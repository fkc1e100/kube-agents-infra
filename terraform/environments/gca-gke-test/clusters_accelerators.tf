# Specialized GPU & TPU Accelerator Clusters

module "cluster_gke_a2_highgpu" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "gke-a2-highgpu"
  location     = "us-central1"
  network      = module.vpc_gke_a2_highgpu.network_name
  subnetwork   = "gke-a2-highgpu-subnet"
  description  = "NVIDIA A100 (40GB) training and inference cluster"

  node_pools = {
    "system" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    }
    "a2-highgpu-8g-a2highgpupool" = {
      machine_type      = "a2-highgpu-8g"
      disk_size_gb      = 200
      accelerator_type  = "nvidia-tesla-a100"
      accelerator_count = 8
      gpu_driver_version = "DEFAULT"
      node_count        = 1
      autoscaling       = true
      min_count         = 0
      max_count         = 4
    }
  }
}

module "cluster_gke_a2_ultra" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "gke-a2-ultra"
  location     = "us-central1"
  network      = module.vpc_gke_a2_ultra.network_name
  subnetwork   = "gke-a2-ultra-subnet"
  description  = "NVIDIA A100 (80GB) high-memory benchmark & CRD builder cluster"

  node_pools = {
    "system" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    }
    "a2-ultragpu-8g-a2ultrapool" = {
      machine_type      = "a2-ultragpu-8g"
      disk_size_gb      = 300
      accelerator_type  = "nvidia-a100-80gb"
      accelerator_count = 8
      gpu_driver_version = "DEFAULT"
      node_count        = 1
      autoscaling       = true
      min_count         = 0
      max_count         = 4
    }
    "bench-gpu" = {
      machine_type      = "a2-ultragpu-4g"
      disk_size_gb      = 200
      accelerator_type  = "nvidia-a100-80gb"
      accelerator_count = 4
      gpu_driver_version = "DEFAULT"
      node_count        = 1
      autoscaling       = true
      min_count         = 0
      max_count         = 2
    }
  }
}

module "cluster_gke_a3_mega" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "gke-a3-mega"
  location     = "us-central1"
  network      = module.vpc_gke_a3_mega.network_name
  subnetwork   = "gke-a3-mega-subnet"
  description  = "NVIDIA H100 Mega (80GB) distributed LLM training cluster"

  node_pools = {
    "system" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    }
    "a3-megagpu-8g-a3megagpupool" = {
      machine_type      = "a3-megagpu-8g"
      disk_size_gb      = 500
      accelerator_type  = "nvidia-h100-mega-80gb"
      accelerator_count = 8
      gpu_driver_version = "DEFAULT"
      node_count        = 1
      autoscaling       = true
      min_count         = 0
      max_count         = 8
    }
  }
}

module "cluster_gke_cursor" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "gke-cursor"
  location     = "us-central1"
  network      = module.vpc_gke_cursor.network_name
  subnetwork   = "gke-cursor-subnet"
  description  = "NVIDIA H200 (141GB) ultra-accelerator cluster"

  node_pools = {
    "system" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    }
    "cursor-v17" = {
      machine_type      = "a3-ultragpu-8g"
      disk_size_gb      = 500
      accelerator_type  = "nvidia-h200-141gb"
      accelerator_count = 8
      gpu_driver_version = "DEFAULT"
      node_count        = 1
      autoscaling       = true
      min_count         = 0
      max_count         = 4
    }
  }
}

module "cluster_gke_tpuv6_dws" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "gke-tpuv6-dws"
  location     = "us-west4"
  network      = module.vpc_slm_training.network_name
  subnetwork   = "gke-tpuv6-dws-subnet"
  description  = "Google Cloud TPU v6e Trillium Dynamic Workload Scheduler cluster"

  node_pools = {
    "system-pool" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 4
    }
    "tpu-v6-pool" = {
      machine_type = "ct5lp-hightpu-4t"
      node_count   = 1
      autoscaling  = false
    }
  }
}
