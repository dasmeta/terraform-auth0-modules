variable "enable_provider" {
  type    = bool
  default = true
}

variable "name" {
  description = "Name of the email provider. Options include mailgun, mandrill, sendgrid, ses, smtp, and sparkpost."
  type        = string
  default     = null
}

variable "default_from_address" {
  type        = string
  description = "Default from address for emails"
}

variable "credentials" {
  type = object({
    access_key_id     = string
    secret_access_key = string
    region            = string
    api_key           = string
  })
  description = "Configuration settings for the credentials for the email provider."
}

variable "templates" {
  type = map(object({
    template                  = string
    enabled                   = bool
    body                      = string
    from                      = string
    subject                   = string
    syntax                    = string
    include_email_in_redirect = optional(bool)
    result_url                = optional(string)
    url_lifetime_in_seconds   = optional(number)
  }))
  description = "Configuration for email templates."
}
