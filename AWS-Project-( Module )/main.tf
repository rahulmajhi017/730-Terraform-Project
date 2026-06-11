# Create VPC
module "vpc" {
  source = "./modules/vpc"

  cidr_block = "192.168.0.0/16"
  vpc_name = "Terraform-vpc"
}

# Create EC2 instance inside the VPC
module "ec2-instance" {
source = "./modules/ec2-instance"
subnet_id = module.vpc.subnet1
vpc_security_group_id =  [module.vpc.aws_security_group]
instance_count = 1
instance_id = "ami-0685bcc683dadb6b9"
instance_name = "terraform-web-server"
instance_type = "t3.micro"
keypair = "730BATCH"
}

# Create s3_bucket
module "s3_bucket" {
  source = "./modules/s3_bucket"
  S3_Bucket = "730-terraform-s3-bucket-08"
}
