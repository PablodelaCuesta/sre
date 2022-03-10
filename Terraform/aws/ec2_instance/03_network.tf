resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    "Name" : "main"
  }
}

# public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public-subnet-cidr-block
  map_public_ip_on_launch = true

  tags = {
    Name = "public"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Routes tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {
    Name = "public-route-table"
  }
}

# Match Route table with Subnet
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# SG - for SSH traffic
resource "aws_security_group" "sg-ssh" {
  name        = "ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" : "ssh"
  }
}

resource "aws_security_group" "sg-public" {
  name        = "public"
  description = "Allow public traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow HTTP traffic from any IP address"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS traffic from any IP address"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" : "public"
  }

}