variable "roles" {
  description = "Roles to create"
  type = list(object({
    description = string
    name        = string
  }))
}

variable "permissions" {
  description = "Permission to configure, resource_server_identifier must be an "
  type = list(object({
    name                       = string
    resource_server_identifier = any
  }))
  default = []
}
