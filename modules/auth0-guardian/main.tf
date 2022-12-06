resource "auth0_guardian" "my_guardian" {
  policy        = var.policy
  email         = var.email
  otp           = var.otp
  recovery_code = var.recovery_code

  #   webauthn_platform {} # This will enable it. Removing this block will disable it.

  webauthn_roaming {
    user_verification = var.user_verification
  }

  dynamic "phone" {
    for_each = var.phone

    provider      = each.value.provider
    message_types = each.value.message_types

    options {
      enrollment_message   = each.value.enrollment_message
      verification_message = each.value.verification_message
    }
  }

  dynamic "push" {
    for_each = var.push

    amazon_sns {
      aws_access_key_id                 = each.value.aws_access_key_id
      aws_region                        = each.value.aws_region
      aws_secret_access_key             = each.value.aws_secret_access_key
      sns_apns_platform_application_arn = each.value.sns_apns_platform_application_arn
      sns_gcm_platform_application_arn  = each.value.sns_gcm_platform_application_arn
    }

    custom_app {
      app_name        = each.value.app_name
      apple_app_link  = each.value.apple_app_link
      google_app_link = each.value.google_app_link
    }
  }

  dynamic "duo" {
    for_each = var.duo

    integration_key = each.value.integration_key
    secret_key      = each.value.secret_key
    hostname        = each.value.hostname
  }
}
