output "worker_ips" {
    value = module.k8s-lon.worker_ips
}

output "master_ips" {
    value = module.k8s-lon.master_ips
}
