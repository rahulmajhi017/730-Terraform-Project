# output of VPC 
output "subnet1" {
  value = aws_subnet.subnet1.id
}

output "subnet2" {
  value = aws_subnet.subnet2.id
}

output "pvt-subnet1" {
  value = aws_subnet.pvt-subnet1.id
}

output "pvt-subnet2" {
  value = aws_subnet.pvt-subnet2.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "aws_security_group" {
  value = aws_security_group.sg.id
}

# Ouputs of Ec2
output "instance_ami" {
  value = aws_instance.my-server[*].id
}

output "instance_pub_ip" {
  value = aws_instance.my-server[*].public_ip
}

output "instance_pvt_ip" {
  value = aws_instance.my-server[*].private_ip
}