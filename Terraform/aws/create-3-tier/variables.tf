# Variables

# Project name
variable "project_name" {
  type        = string
  description = "Project's name"
  default     = "Three_tier_project"
}

# Keys
variable "public_key_path" {
  type        = string
  description = "Path to our public key"
}

# VPC variables
variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "vpc-three-tier"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR Block of the VPC"
  default     = "10.0.0.0/16"
}

# IGW
variable "igw_name" {
  type        = string
  description = "Internet Gateway names"
  default     = "the-igw"
}

# Subnets

# Public subnet
variable "public_subnet_name" {
  type        = string
  description = "Public subnet name"
  default     = "public_subnet_1"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
  default     = "10.0.1.0/24"
}

variable "rt_public_subnet" {
  type        = string
  description = "Route tables name"
  default     = "public-rt"
}

variable "public_subnet" {
  type        = map(any)
  description = "Data about public subnet"
  default = {
    "name" = "public_subnet_1",
    "cidr" = "10.0.1.0/24",
    "rt"   = "public-rt"
  }
}

# Private subnet
variable "private_subnet" {
  type        = map(any)
  description = "Data about private subnet"
  default = {
    "name" = "private_private_1",
    "cidr" = "10.0.2.0/24"
  }
}