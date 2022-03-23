
resource "docker_image" "nodered_image" {
  name = "nginx:1.21-alpine"
}


resource "random_pet" "random_name" {
  count = 2
}

resource "docker_container" "nginx_container" {
  count = 2
  name  = join("-", ["nginx", random_pet.random_name[count.index].id])
  image = docker_image.nodered_image.name

  ports {
    internal = 80
    # external = 8080
  }
}