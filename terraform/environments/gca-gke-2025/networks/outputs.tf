output "networks" {
  value = {
    gemma4_inference = module.vpc_gemma4_inference.network_name
  }
}
