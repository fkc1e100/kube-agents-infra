# Management, Control Plane, and Web Console Autopilot Clusters

module "cluster_ka_webconsole_pr2321" {
  source       = "../../modules/gke-autopilot-cluster"
  project_id   = var.project_id
  cluster_name = "ka-webconsole-pr2321"
  location     = "us-central1"
  network      = "default"
  subnetwork   = "default"
  description  = "Web Console prototype, Scion Chat UI, and public proxy endpoint"
}

module "cluster_kcc_management_cluster" {
  source       = "../../modules/gke-autopilot-cluster"
  project_id   = var.project_id
  cluster_name = "kcc-management-cluster"
  location     = "us-central1"
  network      = "default"
  subnetwork   = "default"
  description  = "Argo CD GitOps Hub, Config Connector manager, and fleet controller"
}
