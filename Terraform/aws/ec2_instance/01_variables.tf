variable "public_key_path" {
  type        = string
  description = "Path to the local public key"
}
variable "private_key_path" {
  type        = string
  description = "Path to the local private key"
}
variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for our VPC"
}
variable "public-subnet-cidr-block" {
  type    = string
  default = "10.0.1.0/24"
}
# variable "public-subnet-cidrs" {
#   type = map(object({
#     cidr_block = string    
#   }))

# }
variable "ec2_instance_type" {
  type        = string
  description = "Default instance type for this project"
  default     = "t2.micro"
}