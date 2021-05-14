output "master_networks" {
  value = module.k8s.master_networks
}

output "worker_networks" {
  value = module.k8s.worker_networks
}
