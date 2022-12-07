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
    aws_access_key_id                 = null
    aws_region                        = "eu-central-1"
    aws_secret_access_key             = null
    sns_apns_platform_application_arn = null
    sns_gcm_platform_application_arn  = null
    app_name                          = null
    apple_app_link                    = null
    google_app_link                   = null
    integration_key                   = null
    secret_key                        = null
    hostname                          = null
  }
}
module "auth0-guardian" {
  source   = "./modules/auth0-guardian"
  for_each = { for k, v in var.mfa : k => v }

  policy            = lookup(each.value, "policy", local.mfa_defaults.policy)
  email             = lookup(each.value, "email", local.mfa_defaults.email)
  otp               = lookup(each.value, "otp", local.mfa_defaults.otp)
  recovery_code     = lookup(each.value, "recovery_code", local.mfa_defaults.recovery_code)
  user_verification = lookup(each.value, "user_verification", local.mfa_defaults.user_verification)

  phone = [{
    provider             = lookup(each.value, "provider", local.mfa_defaults.provider)
    message_types        = lookup(each.value, "message_types", local.mfa_defaults.message_types)
    enrollment_message   = lookup(each.value, "enrollment_message", local.mfa_defaults.enrollment_message)
    verification_message = lookup(each.value, "verification_message", local.mfa_defaults.verification_message)
  }]

  push = [{
    aws_access_key_id                 = lookup(each.value, "aws_access_key_id", local.mfa_defaults.aws_access_key_id)
    aws_region                        = lookup(each.value, "aws_region", local.mfa_defaults.aws_region)
    aws_secret_access_key             = lookup(each.value, "aws_secret_access_key", local.mfa_defaults.aws_secret_access_key)
    sns_apns_platform_application_arn = lookup(each.value, "sns_apns_platform_application_arn", local.mfa_defaults.sns_apns_platform_application_arn)
    sns_gcm_platform_application_arn  = lookup(each.value, "sns_gcm_platform_application_arn", local.mfa_defaults.sns_gcm_platform_application_arn)
    app_name                          = lookup(each.value, "app_name", local.mfa_defaults.app_name)
    apple_app_link                    = lookup(each.value, "apple_app_link", local.mfa_defaults.apple_app_link)
    google_app_link                   = lookup(each.value, "google_app_link", local.mfa_defaults.google_app_link)
  }]

  duo = [{
    integration_key = lookup(each.value, "integration_key", local.mfa_defaults.integration_key)
    secret_key      = lookup(each.value, "secret_key", local.mfa_defaults.secret_key)
    hostname        = lookup(each.value, "hostname", local.mfa_defaults.hostname)
  }]

}

