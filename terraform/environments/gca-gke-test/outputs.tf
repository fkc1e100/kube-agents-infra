output "project_id" {
  description = "Target GCP project"
  value       = var.project_id
}

output "management_clusters" {
  description = "Autopilot management and control plane clusters"
  value = {
    ka_webconsole_pr2321   = module.cluster_ka_webconsole_pr2321.cluster_endpoint
    kcc_management_cluster = module.cluster_kcc_management_cluster.cluster_endpoint
  }
}

output "accelerator_clusters" {
  description = "High-performance GPU and TPU compute clusters"
  value = {
    gke_a2_highgpu = module.cluster_gke_a2_highgpu.cluster_endpoint
    gke_a2_ultra   = module.cluster_gke_a2_ultra.cluster_endpoint
    gke_a3_mega    = module.cluster_gke_a3_mega.cluster_endpoint
    gke_cursor     = module.cluster_gke_cursor.cluster_endpoint
    gke_tpuv6_dws  = module.cluster_gke_tpuv6_dws.cluster_endpoint
  }
}

output "sandbox_clusters" {
  description = "Testing and sandbox clusters"
  value = {
    dataproc_billing_test = module.cluster_dataproc_billing_test.cluster_endpoint
    kcc_addon_test        = module.cluster_kcc_addon_test.cluster_endpoint
    openrl_chaos_sandbox  = module.cluster_openrl_chaos_sandbox.cluster_endpoint
    simple_app            = module.cluster_simple_app.cluster_endpoint
    containercluster_w2   = module.cluster_containercluster_west2.cluster_endpoint
  }
}

output "microservice_clusters" {
  description = "Distributed microservices across global regions"
  value = {
    prod_analytics_store_asia_east1  = module.cluster_prod_analytics_store_asia_east1.cluster_endpoint
    prod_analytics_store_us_central1 = module.cluster_prod_analytics_store_us_central1.cluster_endpoint
    hpc_batch_compute_asia_se1       = module.cluster_hpc_batch_compute_asia_se1.cluster_endpoint
    hpc_batch_compute_us_central1    = module.cluster_hpc_batch_compute_us_central1.cluster_endpoint
    prod_catalog_sync_europe_west1   = module.cluster_prod_catalog_sync_europe_west1.cluster_endpoint
    prod_catalog_sync_us_central1    = module.cluster_prod_catalog_sync_us_central1.cluster_endpoint
    prod_ha_payments_europe_west3    = module.cluster_prod_ha_payments_europe_west3.cluster_endpoint
    prod_ha_payments_us_central1     = module.cluster_prod_ha_payments_us_central1.cluster_endpoint
    prod_api_router_us_central1      = module.cluster_prod_api_router_us_central1.cluster_endpoint
    prod_api_router_us_east1         = module.cluster_prod_api_router_us_east1.cluster_endpoint
    prod_auto_scaler_us_central1     = module.cluster_prod_auto_scaler_us_central1.cluster_endpoint
    prod_auto_scaler_us_west1        = module.cluster_prod_auto_scaler_us_west1.cluster_endpoint
    edge_ingress_gateway_06          = module.cluster_edge_ingress_gateway_06.cluster_endpoint
  }
}

output "fleet_cluster_count" {
  description = "Total number of live clusters managed in gca-gke-test"
  value       = 25
}
