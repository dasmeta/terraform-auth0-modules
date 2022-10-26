variable "enable_ses_email_provider" {
  type    = bool
  default = true
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
  })
  description = "Configuration settings for the credentials for the email provider."
}
