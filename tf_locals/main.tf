variable "resource_tags" {
    type = map(string)
    default = {
        cc = "financeiro"
        time = "douglas"
    }
}

locals {
    required_tags = {
        "project" = "impacta" 
        "env" = "prod"
    }
    tags = merge(var.resource_tags,local.required_tags)
}

output "tags" {
    value = local.tags
}