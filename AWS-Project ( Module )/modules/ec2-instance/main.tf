# Ec2 Instance
resource "aws_instance" "my-server" {
  ami           = var.instance_id
  instance_type = var.instance_type
  key_name = var.keypair
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_id
  tags = {
    Name = var.instance_name
  }
}
