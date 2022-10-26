variable "name" {
  description = "The name of this organization."
  type        = string
  default     = "auth0-org"
}

variable "display_name" {
  description = "Friendly name of this organization."
  type        = string
  default     = "Auth0 org"
}

variable "branding" {
  description = "Defines how to style the login pages."
  type = list(object({
    logo_url = string
    colors = object({
      primary         = string
      page_background = string
    })
  }))
  default = []
}

variable "connections" {
  description = "Connections configuration for organization."
  type = list(object({
    connection_id = string
  }))
  default = []
}
