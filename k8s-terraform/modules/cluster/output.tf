output "master_networks" {
  value = [for i, v in openstack_compute_instance_v2.k8s-master[*].name: { "name": openstack_compute_instance_v2.k8s-master[i].name, "ips": openstack_compute_instance_v2.k8s-master[i].network.*.fixed_ip_v4}]
}

output "worker_networks" {
  value = [for i, v in openstack_compute_instance_v2.k8s-node[*].name: { "name": openstack_compute_instance_v2.k8s-node[i].name, "ips" : openstack_compute_instance_v2.k8s-node[i].network.*.fixed_ip_v4}]
}
