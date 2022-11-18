variable "users" {
  default = []
  type = list(object({
    name     = string
    email    = string
    roles    = list(string)
    password = string
  }))
}

variable "connection_name" {
  type    = string
  default = "Username-Password-Authentication"
}
