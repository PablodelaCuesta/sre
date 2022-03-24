

module "images" {
  source   = "./images"
  image_in = var.image[terraform.workspace]
}

resource "docker_container" "nginx_container" {
  name  = join("-", ["nginx", terraform.workspace])
  image = module.images.image_out

  ports {
    internal = var.int_port
    external = var.ext_port
  }
}