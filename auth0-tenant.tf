module "auth0-tenant" {
  source   = "./modules/auth0-tenant"
  for_each = { for v in var.tenant : v.friendly_name => v }

  friendly_name           = each.value.friendly_name
  allowed_logout_urls     = each.value.allowed_logout_urls
  default_audience        = each.value.default_audience
  picture_url             = each.value.picture_url
  enabled_locales         = each.value.enabled_locales
  change_password         = each.value.change_password
  guardian_mfa_page       = each.value.guardian_mfa_page
  default_redirection_uri = each.value.default_redirection_uri
  sandbox_version         = each.value.sandbox_version
  error_page              = each.value.error_page
  default_directory       = each.value.default_directory
  support_email           = each.value.support_email
  support_url             = each.value.support_url
  session_lifetime        = each.value.session_lifetime
  idle_session_lifetime   = each.value.idle_session_lifetime
  session_cookie          = each.value.session_cookie
  universal_login         = each.value.universal_login
  flags                   = each.value.flags
}
