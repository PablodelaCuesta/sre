

# Terraform commands

````bash

# apply the infra defined
terraform apply --auto-approve

# show the output of the project
terraform output

# Terraform console
terraform console
````


## Terraform piaces of code

````hcl


output "IP_Address" {
    value = docker_container.nodered_container.ip_address
    description = ""
}
````

## Terraform function

````hcl

````