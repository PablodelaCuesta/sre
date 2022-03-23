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
  default = [1880, 1890, 1990]

  validation {
    condition     = min(var.nginx_list_ports...) > 0 && max(var.nginx_list_ports...) <= 65535
    error_message = "The port number is out of limits."
  }
}

locals {
  container_count = 10
}