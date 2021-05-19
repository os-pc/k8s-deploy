variable "region" {
  description = "Server Region"
  type        = string
}

variable "master_count" {
  description = "amount of k8s master nodes"
  type        = number
}

variable "worker_count" {
  description = "amount of k8s worker nodes"
  type        = number
}

variable "image" {
  description = "name of the VM image to boot"
  type        = string
  default     = "Ubuntu 20.04 LTS (Focal Fossa) (Cloud)"
}

variable "flavor_id" {
  description = "flavor type"
  type        = string
  default     = "performance1-2"
}

variable "pub_key_file" {
  description = "public key file for the keypair in the cloud"
  type        = string
}
