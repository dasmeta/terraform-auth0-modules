variable "name" {
  description = "Name of the connection"
  type        = string
  default     = "Example-Connection"
}

# variable "is_domain_connection" {
#   description = "Indicates whether the connection is domain level."
#   type        = bool
#   default     = true
# }

variable "password_policy" {
  description = "Indicates level of password strength to enforce during authentication."
  type        = string
  default     = "good"
}

variable "brute_force_protection" {
  description = "Indicates whether to enable brute force protection, which will limit the number of signups and failed logins from a suspicious IP address."
  type        = bool
  default     = true
}

# variable "enabled_database_customization" {
#   description = "enabled_database_customization"
#   type        = bool
#   default     = false
# }

# variable "import_mode" {
#   description = "Indicates whether you have a legacy user store and want to gradually migrate those users to the Auth0 user store."
#   type        = bool
#   default     = false
# }

# variable "requires_username" {
#   description = "Indicates whether the user is required to provide a username in addition to an email address."
#   type        = bool
#   default     = false
# }

# variable "disable_signup" {
#   description = "Indicates whether to allow user sign-ups to your application."
#   type        = bool
#   default     = false
# }

variable "password_history" {
  description = "Configuration settings for the password history that is maintained for each user to prevent the reuse of passwords."
  type = object({
    enable = bool
    size   = number
  })
  default = ({
    enable = true
    size   = 3
  })
}

variable "password_no_personal_info" {
  description = "Configuration settings for the password personal info check."
  type        = bool
  default     = true
}

variable "password_dictionary" {
  description = "Configuration settings for the password dictionary check."
  type = object({
    enable     = bool
    dictionary = list(string)
  })
  default = ({
    enable     = true
    dictionary = []
  })
}

# variable "password_complexity_options" {
#   description = "Configuration settings for password complexity."
#   type        = number
#   default     = 12
# }

# variable "validation" {
#   description = "Validation of the minimum and maximum values allowed for a user to have as username."
#   type = object({
#     username = object({
#       min = number
#       max = number
#     })
#   })
#   default = ({
#     username = ({
#       min = 10
#       max = 40
#     })
#   })
# }

# variable "enabled_clients" {
#   type        = list(string)
#   default     = []
#   description = "IDs of the clients for which the connection is enabled"
# }

# variable "mfa" {
#   description = "MFA configuration for module"
#   type = object({
#     active                 = bool
#     return_enroll_settings = bool
#   })
#   default = ({
#     active                 = true
#     return_enroll_settings = true
#   })
# }
