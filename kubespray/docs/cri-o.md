# CRI-O

[CRI-O] is a lightweight container runtime for Kubernetes.
Kubespray supports basic functionality for using CRI-O as the default container runtime in a cluster.

* Kubernetes supports CRI-O on v1.11.1 or later.
* `scale.yml` and `upgrade-cluster.yml` are not supported on clusters using CRI-O.

_To use the CRI-O container runtime set the following variables:_

## all.yml

```yaml
download_container: false
skip_downloads: false
```

## k8s-cluster.yml

```yaml
kubelet_deployment_type: host
container_manager: crio
```

## etcd.yml

```yaml
etcd_deployment_type: host
```

[CRI-O]: https://cri-o.io/
