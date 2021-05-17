terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

data "local_file" "ssh_key" {
  filename = pathexpand(var.pub_key_file)
}

resource "openstack_compute_keypair_v2" "k8s_provision_key" {
  name       = "k8s-provision-key"
  public_key = data.local_file.ssh_key.content
  region     = var.region
}

resource "openstack_compute_instance_v2" "k8s-master" {
  count     = var.master_count
  name      = format("k8s-master%02d", count.index + 1)
  region    = var.region
  image_id  = var.image_id
  flavor_id = var.flavor_id
  key_pair  = openstack_compute_keypair_v2.k8s_provision_key.name
  user_data = "#cloud-config\npackages:\n - python\n - python-netaddr"

  network {
    uuid = "00000000-0000-0000-0000-000000000000"
    name = "public"
  }

  network {
    uuid = "11111111-1111-1111-1111-111111111111"
    name = "private"
  }

  metadata = {
    role = "k8s-master"
    env  = var.region
  }

}

resource "openstack_compute_instance_v2" "k8s-node" {
  count     = var.worker_count
  name      = format("k8s-node%02d", count.index + 1)
  region    = var.region
  image_id  = var.image_id
  flavor_id = var.flavor_id
  key_pair  = openstack_compute_keypair_v2.k8s_provision_key.name
  user_data = "#cloud-config\npackages:\n - python\n - python-netaddr"

  network {
    uuid = "00000000-0000-0000-0000-000000000000"
    name = "public"
  }

  network {
    uuid = "11111111-1111-1111-1111-111111111111"
    name = "private"
  }

  metadata = {
    role = "k8s-node"
    env  = var.region
  }

}
