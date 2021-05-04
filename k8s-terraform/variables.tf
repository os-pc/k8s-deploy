variable "pub_key_file" {
  description = "public key file for the keypair in the cloud"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
