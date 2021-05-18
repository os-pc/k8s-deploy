output "worker_ips" {
  value = openstack_compute_instance_v2.k8s-node[*].network.0.fixed_ip_v4
}

output "master_ips" {
  value = openstack_compute_instance_v2.k8s-master[*].network.0.fixed_ip_v4
}
