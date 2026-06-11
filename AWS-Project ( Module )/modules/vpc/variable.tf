# Variables for VPC
variable "ports" {
  default = 22
}

variable "cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}