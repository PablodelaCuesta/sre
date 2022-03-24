# output "instance_ip" {
#     value = aws_instance.web.
# }

output "az" {
  value = data.aws_availability_zones.zones.names
}