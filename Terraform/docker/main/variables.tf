variable "nginx_int_port" {
  type    = number
  default = 80

  validation {
    condition     = var.nginx_int_port == 80
    error_message = "The internal port must be 80."
  }
}

variable "nginx_ext_port" {
  type = number

  validation {
    condition     = var.nginx_ext_port <= 65535 && var.nginx_ext_port > 0
    error_message = "The port value must be a valid port number."
  }
}

# List validaton
variable "nginx_list_ports" {
  type    = list(number)
  default = [8080, 8081, 8082]

  validation {
    condition     = min(var.nginx_list_ports...) > 0 && max(var.nginx_list_ports...) <= 65535
    error_message = "The port number is out of limits."
  }
}

locals {
  container_count = 10
}

variable "images" {
  type        = map(any)
  description = "Images containers for differents environments."
  default = {
    dev  = "nginx:latest",
    prod = "nginx:1.21-alpine"
  }
}

variable "nginx_ext_port_map" {
  type        = map(list(number))
  description = "Ports depends on environment."
}