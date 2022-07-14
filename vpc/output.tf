output "nome_da_vpc" {
 value = module.douglas.public_subnet_arns
}

output "subnet" {
 value = var.labels["env"]
}
