locals {
  mfa_defaults = {
    policy           = "all-applications"
    email            = true
    otp              = true
    recovery_code    = true
    webauthn_roaming = "required"
    phone            = []
    push             = []
    duo              = []
  }
}

module "auth0-guardian" {
  source   = "./modules/auth0-guardian"
  for_each = { for k, v in var.mfa : k => v }

  policy           = lookup(each.value, "policy", local.mfa_defaults.policy)
  email            = lookup(each.value, "email", local.mfa_defaults.email)
  otp              = lookup(each.value, "otp", local.mfa_defaults.otp)
  recovery_code    = lookup(each.value, "recovery_code", local.mfa_defaults.recovery_code)
  webauthn_roaming = lookup(each.value, "webauthn_roaming", local.mfa_defaults.webauthn_roaming)
  phone            = lookup(each.value, "phone", local.mfa_defaults.phone)
  push             = lookup(each.value, "push", local.mfa_defaults.push)
  duo              = lookup(each.value, "duo", local.mfa_defaults.duo)
}

