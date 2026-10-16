# Sandbox, Testing, and Evaluation Clusters

module "cluster_dataproc_billing_test" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "dataproc-billing-test-cluster"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Dataproc and BigQuery billing integration test cluster"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-4"
      node_count   = 3
      autoscaling  = true
      min_count    = 1
      max_count    = 5
    }
    "dp-shared" = {
      machine_type = "e2-standard-4"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 3
    }
  }
}

module "cluster_kcc_addon_test" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "kcc-addon-test-cluster"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "Config Connector Add-on deprecation and migration telemetry testing"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-2"
      node_count   = 1
      autoscaling  = false
    }
  }
}

module "cluster_openrl_chaos_sandbox" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "openrl-chaos-sandbox"
  location     = "us-central1-a"
  network      = "default"
  subnetwork   = "default"
  description  = "OpenRL reinforcement learning agent chaos engineering sandbox"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-standard-8"
      node_count   = 3
      autoscaling  = false
    }
  }
}

module "cluster_simple_app" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "simple-app-cluster"
  location     = "us-central1"
  network      = "default"
  subnetwork   = "default"
  description  = "Sample multi-tenant web application demo cluster"

  node_pools = {
    "app-pool" = {
      machine_type = "e2-medium"
      node_count   = 1
      autoscaling  = true
      min_count    = 1
      max_count    = 3
    }
  }
}

module "cluster_containercluster_west2" {
  source       = "../../modules/gke-standard-cluster"
  project_id   = var.project_id
  cluster_name = "containercluster-6lgctkbp5dciv7y"
  location     = "us-west2"
  network      = "default"
  subnetwork   = "default"
  description  = "Regional failover and disaster recovery test cluster"

  node_pools = {
    "default-pool" = {
      machine_type = "e2-medium"
      node_count   = 1
      autoscaling  = false
    }
  }
}
