locals {
  mfa_defaults = {
    policy                            = "all-applications"
    email                             = true
    otp                               = true
    recovery_code                     = true
    user_verification                 = "required"
    provider                          = "auth0"
    message_types                     = ["sms"]
    enrollment_message                = "{{code}} is your verification code for {{tenant.friendly_name}}. Please enter this code to verify your enrollment."
    verification_message              = "{{code}} is your verification code for {{tenant.friendly_name}}."
    aws_access_key_id                 = ""
    aws_region                        = ""
    aws_secret_access_key             = ""
    sns_apns_platform_application_arn = ""
    sns_gcm_platform_application_arn  = ""
    app_name                          = null
    apple_app_link                    = null
    google_app_link                   = null
    integration_key                   = ""
    secret_key                        = ""
    hostname                          = ""
  }
}
module "auth0-guardian" {
  source   = "./modules/auth0-guardian"
  for_each = { for k, v in var.mfa : k => v }

  policy           = lookup(each.value, "policy", local.mfa_defaults.policy)
  email            = lookup(each.value, "email", local.mfa_defaults.email)
  otp              = lookup(each.value, "otp", local.mfa_defaults.otp)
  recovery_code    = lookup(each.value, "recovery_code", local.mfa_defaults.recovery_code)
  webauthn_roaming = lookup(each.value, "webauthn_roaming", [])
  phone            = lookup(each.value, "phone", [])
  push             = lookup(each.value, "push", [])
  duo              = lookup(each.value, "duo", [])
}

