module "auth0-tenant" {
  source   = "./modules/auth0-tenant"
  for_each = { for v in var.tenant : v.friendly_name => v }

  friendly_name           = each.value.friendly_name
  change_password         = each.value.change_password
  guardian_mfa_page       = lookup(each.value, "guardian_mfa_page", [])
  default_redirection_uri = each.value.default_redirection_uri
  sandbox_version         = each.value.sandbox_version
  error_page              = lookup(each.value, "error_page", [])
  default_directory       = lookup(each.value, "default_directory", null)
  support_email           = lookup(each.value, "support_email", null)
  support_url             = lookup(each.value, "support_url", null)
  session_lifetime        = lookup(each.value, "session_lifetime", null)
  idle_session_lifetime   = lookup(each.value, "idle_session_lifetime", null)
  session_cookie          = lookup(each.value, "session_cookie", null)
  flags                   = lookup(each.value, "flags", {})
}
