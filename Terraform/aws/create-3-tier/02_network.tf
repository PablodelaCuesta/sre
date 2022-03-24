
# Creation of a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

# AZ available
data "aws_availability_zones" "az_available" {
  state = "available"
}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count      = length(data.aws_availability_zones.az_available.names)
  availability_zone = data.aws_availability_zones.az_available.names[count.index]

  cidr_block = "10.0.${count.index}.0/24"

  map_public_ip_on_launch = true
  tags = {
    "Name" = var.public_subnet["name"]
  }
}