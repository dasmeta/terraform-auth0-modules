variable "name" {
  description = "Name of the connection."
  type        = string
  default     = "Google-OAuth2-Connection"
}

# variable "client_id" {
#   description = "The strategy's client ID."
#   type        = string
# }

# variable "client_secret" {
#   description = "The strategy's client secret."
#   type        = string
# }

variable "allowed_audiences" {
  description = "List of allowed audiences."
  type        = list(string)
  default     = ["example.com", "api.example.com"]
}

variable "scopes" {
  description = "Permissions to grant to the connection."
  type        = list(string)
  default     = ["email", "profile", "gmail", "youtube"]
}

variable "enabled_clients" {
  description = "IDs of the clients for which the connection is enabled."
  type        = list(string)
  default     = []
}

variable "is_domain_connection" {
  type    = bool
  default = false
}

variable "set_user_root_attributes" {
  description = "Determines whether the 'name', 'given_name', 'family_name', 'nickname', and 'picture' attributes can be independently updated when using an external IdP."
  type        = string
  default     = "on_each_login"
}
