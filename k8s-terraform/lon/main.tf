terraform {
  backend "swift" {
    auth_url          = "https://identity.api.rackspacecloud.com/v2.0/"
    region_name       = "LON"
    container         = "k8stest"
    archive_container = "k8stest-archive"
  }
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

provider "openstack" {
  # username   =  "uses OS_USERNAME env var"
  # password = "uses OS_PASSWORD env var"
  # tenantid = "OS_TENANT_ID"
  # token = "can use token but remember tokens expire OS_AUTH_TOKEN env var"
  auth_url    = "https://identity.api.rackspacecloud.com/v2.0/"
  insecure    = true
}

module "k8s-lon" {
  source = "../modules/cluster"

  region       = "lon"
  master_count = 3
  worker_count = 2
  # Ubuntu 20.04 LTS
  image_id = "72b4b2b7-a805-46f4-b1ff-f48092acc0bf"
  flavor_id = "performance1-2"
}

