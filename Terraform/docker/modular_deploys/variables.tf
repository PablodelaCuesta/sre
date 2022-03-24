variable "int_port" {
  type    = number
  default = 1880
}

variable "ext_port" {
  type    = number
  default = 1880
}

variable "image" {
  type        = map(any)
  description = "Images containers for different workspace"
  default = {
    dev  = "nginx:1.21"
    prod = "nginx:1.21-alpine"
  }
}