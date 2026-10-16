output "networks" {
  value = {
    gke_a2_highgpu = module.vpc_gke_a2_highgpu.network_name
    gke_a2_ultra   = module.vpc_gke_a2_ultra.network_name
    gke_a3_mega    = module.vpc_gke_a3_mega.network_name
    gke_cursor     = module.vpc_gke_cursor.network_name
    slm_training   = module.vpc_slm_training.network_name
  }
}
