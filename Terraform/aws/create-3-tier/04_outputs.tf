output "az_zones" {
  value = data.aws_availability_zones.az_available.names
}