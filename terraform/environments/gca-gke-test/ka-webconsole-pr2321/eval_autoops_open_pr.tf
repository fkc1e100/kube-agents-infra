# Day-0 bootstrap and default sizing variables for eval-autoops-open-pr.
# Active Kubernetes workload manifests live under manifests/apps/eval-autoops-open-pr/.

variable "eval_open_pr_workload_memory_limit" {
  description = "Bootstrap container memory limit for eval-open-pr-workload"
  type        = string
  default     = "64Mi"
}

resource "kubernetes_namespace_v1" "eval_autoops_open_pr" {
  metadata {
    name = "eval-autoops-open-pr"
    labels = {
      environment = "eval"
      workload    = "eval-open-pr-workload"
    }
  }
}

resource "kubernetes_limit_range_v1" "eval_autoops_open_pr_defaults" {
  metadata {
    name      = "eval-autoops-open-pr-limits"
    namespace = kubernetes_namespace_v1.eval_autoops_open_pr.metadata[0].name
  }
  spec {
    limit {
      type = "Container"
      default = {
        memory = var.eval_open_pr_workload_memory_limit
      }
      default_request = {
        cpu    = "10m"
        memory = var.eval_open_pr_workload_memory_limit
      }
    }
  }
}
