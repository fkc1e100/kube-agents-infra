output "project_id" {
  description = "Target GCP project"
  value       = var.project_id
}

output "clusters" {
  description = "Clusters in gca-gke-2025"
  value = {
    kcc_gitops_hub = module.cluster_kcc_gitops_hub.cluster_endpoint
    openrl_gpu_hub = module.cluster_openrl_gpu_hub.cluster_endpoint
  }
}

output "cluster_count" {
  description = "Total number of clusters in gca-gke-2025"
  value       = 2
}
