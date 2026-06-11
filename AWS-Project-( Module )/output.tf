# Output for Ec2
output "instance_ami" {
  value = module.ec2-instance.instance_ami
}

output "instance_pub_ip" {
  value = module.ec2-instance.instance_pub_ip
}

output "instance_pvt_ip" {
  value = module.ec2-instance.instance_pvt_ip
}

# Output of S3
output "s3_bucket" {
  value = module.s3_bucket.s3_bucket
}

# Output of VPC 
output "subnet1" {
  value = module.vpc.subnet1
}

output "subnet2" {
  value = module.vpc.subnet2
}

output "pvt-subnet1" {
  value = module.vpc.pvt-subnet1
}

output "pvt-subnet2" {
  value = module.vpc.pvt-subnet2
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "aws_security_group" {
  value = module.vpc.aws_security_group
} 

