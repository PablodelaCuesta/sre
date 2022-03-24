
resource "docker_image" "nodered_image" {
  name = var.images[terraform.workspace]
}

resource "random_string" "container_name" {
  length  = 4
  upper   = false
  special = false
  count   = length(var.nginx_list_ports)
}


resource "docker_container" "nginx_container" {
  count = length(var.nginx_list_ports)
  name  = join("-", ["nginx", terraform.workspace, random_string.container_name[count.index].result])
  image = docker_image.nodered_image.name

  ports {
    internal = 80
    external = var.nginx_list_ports[count.index]
  }

  volumes {
    container_path = "/app"
    host_path      = "${path.cwd}/app"
  }
}