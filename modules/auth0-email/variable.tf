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

// Template
variable "create_template" {
  type = bool
  default = false
}

variable "email_template" {
  type = string
  description = "Email template name"
}

variable "body_template" {
  type = string
  description = "Body of the email template."
}

variable "from" {
  type = string
  description = "Email address to use as the sender."
}

variable "result_url" {
    type = string
    description = "URL to redirect the user to after a successful action"
}

variable "subject" {
  type = string
  description = "Subject line of the email"
}

variable "syntax" {
  type = string
  default = "liquid"
  description = "Syntax of the template body"
}

variable "url_lifetime_in_seconds" {
  type = number
  default = 3600
}

variable "enbale_teplate" {
  type = bool
  default = true
}