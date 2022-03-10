resource "aws_key_pair" "terraform" {
  key_name   = "terraform-key"
  public_key = file(var.public_key_path)

  tags = {
    "Name" = "Terraform public key"
  }
}