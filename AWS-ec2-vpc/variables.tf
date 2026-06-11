# Variable
variable "region" {
  type = string
}

variable "s3_bucket" {
  type = string
}
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

variable "ports" {
  type = string
}