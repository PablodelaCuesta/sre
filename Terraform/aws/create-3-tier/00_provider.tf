
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.3.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

# Configurations
resource "aws_key_pair" "terraform" {
  key_name   = "terraform-key-${var.project_name}"
  public_key = file(var.public_key_path)

  tags = {
    "Name" = "Terraform public key"
  }
}