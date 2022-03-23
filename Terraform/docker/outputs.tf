output "container-name" {
  value = docker_container.nginx_container[*].name
}