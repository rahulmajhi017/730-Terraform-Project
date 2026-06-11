# Create Security_group 
resource "aws_security_group" "sg" {
  name = "terra-sg"
  vpc_id = aws_vpc.vpc.id

   ingress {
      from_port = var.ports
      to_port = var.ports
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "terraform-vpc"
  }
}

#public-Subnet
resource "aws_subnet" "subnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pub-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"
  tags = {
    Name = "pub-2"
  }
}

# Private-Subnet
resource "aws_subnet" "pvt-subnet1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "pvt-1"
  }
}

resource "aws_subnet" "pvt-subnet2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.4.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "pvt-2"
  }
}

# Internate-Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "terra-igw"
  }
}

# Elastic-IP
resource "aws_eip" "eip" {
  domain = "vpc"
}

# NAT-Gateway
resource "aws_nat_gateway" "nat-igw" {
  allocation_id = aws_eip.eip.id
  subnet_id = aws_subnet.subnet1.id
  tags = {
    Name = "terra-nat-igw"
  }
}

# Public Route
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "terra-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Route-Table Association
resource "aws_route_table_association" "rt1" {
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.subnet1.id
}

resource "aws_route_table_association" "rt2" {
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.subnet2.id
}

# Private Route
resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "terra-pvt-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-igw.id
  }
}

# Route-Table Association ( Private )
resource "aws_route_table_association" "pvt-rt1" {
  route_table_id = aws_route_table.pvt-rt.id
  subnet_id = aws_subnet.pvt-subnet1.id
}

resource "aws_route_table_association" "pvt-rt2" {
  route_table_id = aws_route_table.pvt-rt.id
  subnet_id = aws_subnet.pvt-subnet2.id
}
