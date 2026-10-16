# Custom VPC networks for gca-gke-2025 AI/ML workloads

module "vpc_gemma4_inference" {
  source       = "../../modules/vpc-network"
  project_id   = var.project_id
  network_name = "gemma4-inference-vpc"
  subnets = [
    {
      name          = "openrl-gpu-subnet-east1"
      ip_cidr_range = "10.60.0.0/20"
      region        = "us-east1"
    }
  ]
}
