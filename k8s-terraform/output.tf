output "worker_ips" {
  value = module.k8s.worker_ips
}

output "master_ips" {
  value = module.k8s.master_ips
}
