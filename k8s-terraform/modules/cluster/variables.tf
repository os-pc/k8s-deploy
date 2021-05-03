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

variable "image_id" {
  description = "image to boot"
  type        = string
  default     = "72b4b2b7-a805-46f4-b1ff-f48092acc0bf"
}

variable "flavor_id" {
  description = "flavor type"
  type        = string
  default     = "performance1-2"
}

variable key_name {
  description = "keypair name in the cloud"
  type        = string
  default     = "k3s_master"
}
