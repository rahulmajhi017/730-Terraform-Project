# Variable for Ec2
variable "instance_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}
variable "instance_name" {
  type = string
}

variable "keypair" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_id" {
  type = list(string)
}

