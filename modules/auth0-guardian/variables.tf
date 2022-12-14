variable "policy" {
  type        = string
  default     = "all-applications"
  description = "Policy to use. Available options are never, all-applications and confidence-score."
}

variable "email" {
  type    = bool
  default = false
}

variable "otp" {
  type        = bool
  default     = false
  description = "Indicates whether one time password MFA is enabled."
}

variable "recovery_code" {
  type        = bool
  default     = false
  description = "Indicates whether recovery code MFA is enabled."
}

// Webauthn Roaming
variable "webauthn_roaming" {
  type    = list(any)
  default = []
}

variable "phone" {
  type        = list(any)
  default     = []
  description = "[{ message_types = 'sms', provider = 'auth0', enrollment_message = '', verification_message = ''}] "
}

variable "push" {
  type        = list(any)
  default     = []
  description = "[{aws_access_key_id = ''',aws_region = '',aws_secret_access_key  = '',sns_apns_platform_application_arn = '', sns_gcm_platform_application_arn = ''', app_name = '', apple_app_link = '', google_app_link = ''}]"
}

variable "duo" {
  type        = any
  default     = {}
  description = "[{hostname = '', integration_key = '', secret_key = '' }]"
}
