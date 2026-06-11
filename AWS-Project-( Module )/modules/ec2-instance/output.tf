# Output for Ec2
output "instance_ami" {
  value = aws_instance.my-server[*].id
}

output "instance_dns" {
  value = aws_instance.my-server[*].public_dns
}

output "instance_pub_ip" {
  value = aws_instance.my-server[*].public_ip
}

output "instance_pvt_ip" {
  value = aws_instance.my-server[*].private_ip
}
