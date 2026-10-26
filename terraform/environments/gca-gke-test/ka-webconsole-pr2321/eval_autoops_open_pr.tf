resource "kubernetes_namespace_v1" "eval_autoops_open_pr" {
  metadata {
    name = "eval-autoops-open-pr"
    labels = {
      environment = "eval"
    }
  }
}

resource "kubernetes_deployment_v1" "eval_open_pr_workload" {
  metadata {
    name      = "eval-open-pr-workload"
    namespace = kubernetes_namespace_v1.eval_autoops_open_pr.metadata[0].name
    labels = {
      app = "eval-open-pr-workload"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "eval-open-pr-workload"
      }
    }
    template {
      metadata {
        labels = {
          app = "eval-open-pr-workload"
        }
      }
      spec {
        automount_service_account_token = false
        container {
          name    = "allocator"
          image   = "busybox:1.36"
          command = ["sh", "-c", "dd if=/dev/zero of=/dev/null bs=96M count=1 && sleep 3600"]
          resources {
            requests = {
              cpu    = "10m"
              memory = "64Mi"
            }
            limits = {
              memory = "64Mi"
            }
          }
        }
      }
    }
  }
}
