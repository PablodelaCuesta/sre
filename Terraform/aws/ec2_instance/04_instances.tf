# Get AMI for Ubuntu instances
data "aws_ami" "ubuntu-ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }


}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu-ami.id
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.terraform.key_name

  vpc_security_group_ids = [
    aws_security_group.sg-ssh.id,
    aws_security_group.sg-public.id
  ]

  for_each          = toset(data.aws_availability_zones.zones.names)
  availability_zone = each.key

  # count     = length(data.aws_availability_zones.zones.names)
  # subnet_id = aws_subnet.public-subnet[count.index].id

  tags = {
    "Name" : "web"
    "Example" : "True"
    "Zones" : "Zone: ${each.key}"
  }
}