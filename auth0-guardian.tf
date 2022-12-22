module "auth0-guardian" {
  source   = "./modules/auth0-guardian"
  for_each = { for k, v in var.mfa : k => v }

  policy           = each.value.policy
  email            = each.value.email
  otp              = each.value.otp
  recovery_code    = each.value.recovery_code
  webauthn_roaming = each.value.webauthn_roaming
  phone            = each.value.phone
  push             = each.value.push
  duo              = each.value.duo
}
