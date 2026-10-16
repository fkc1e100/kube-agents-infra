output "cluster_name" {
  description = "The name of the cluster"
  value       = module.cluster.cluster_name
}

output "cluster_endpoint" {
  description = "The IP address of the cluster Kubernetes master"
  value       = module.cluster.cluster_endpoint
  sensitive   = true
}

output "cluster_id" {
  description = "An identifier for the resource with format projects/{{project}}/locations/{{location}}/clusters/{{name}}"
  value       = module.cluster.cluster_id
}
