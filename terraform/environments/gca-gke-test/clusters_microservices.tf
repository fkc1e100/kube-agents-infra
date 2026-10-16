# Distributed Multi-Region Workload & Microservice Clusters

# 1. Analytics Store (15)
module "cluster_prod_analytics_store_asia_east1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-analytics-store-15"
  location     = "asia-east1-b"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Analytics Store - APAC East Replica"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

module "cluster_prod_analytics_store_us_central1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-analytics-store-15"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Analytics Store - Primary US Central Store"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

# 2. HPC Batch Compute (17)
module "cluster_hpc_batch_compute_asia_se1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "hpc-batch-compute-17"
  location     = "asia-southeast1-b"
  network      = "default"
  subnetwork   = "default"
  description  = "HPC Batch Compute - Southeast Asia Pool"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

module "cluster_hpc_batch_compute_us_central1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "hpc-batch-compute-17"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "HPC Batch Compute - US Central Pool"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

# 3. Catalog Sync (13)
module "cluster_prod_catalog_sync_europe_west1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-catalog-sync-13"
  location     = "europe-west1-c"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Catalog Synchronization - EMEA West"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

module "cluster_prod_catalog_sync_us_central1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-catalog-sync-13"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Catalog Synchronization - US Central"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

# 4. HA Payments (14)
module "cluster_prod_ha_payments_europe_west3" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-ha-payments-14"
  location     = "europe-west3-b"
  network      = "default"
  subnetwork   = "default"
  description  = "High-Availability Payments - Frankfurt Gateway"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

module "cluster_prod_ha_payments_us_central1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-ha-payments-14"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "High-Availability Payments - US Central Gateway"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

# 5. API Router (07)
module "cluster_prod_api_router_us_central1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-api-router-07"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Edge API Router - Central Region"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

module "cluster_prod_api_router_us_east1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-api-router-07"
  location     = "us-east1-c"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Edge API Router - East Region"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

# 6. Auto Scaler (10)
module "cluster_prod_auto_scaler_us_central1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-auto-scaler-10"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Workload Autoscaler - Central Region"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

module "cluster_prod_auto_scaler_us_west1" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "prod-auto-scaler-10"
  location     = "us-west1-b"
  network      = "default"
  subnetwork   = "default"
  description  = "Production Workload Autoscaler - West Region"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}

# 7. Edge Ingress Gateway (06)
module "cluster_edge_ingress_gateway_06" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "edge-ingress-gateway-06"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Global ingress gateway and perimeter firewall routing"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 2
      autoscaling  = false
    }
  }
}
