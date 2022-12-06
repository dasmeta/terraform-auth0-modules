locals {
  tenant = {
    flags = {
      allow_legacy_delegation_grant_types    = "false"
      allow_legacy_ro_grant_types            = "false"
      allow_legacy_tokeninfo_endpoint        = "false"
      dashboard_insights_view                = "false"
      dashboard_log_streams_next             = "false"
      disable_clickjack_protection_headers   = "false"
      disable_fields_map_fix                 = "false"
      disable_management_api_sms_obfuscation = "false"
      enable_adfs_waad_email_verification    = "false"
      enable_apis_section                    = "false"
      enable_client_connections              = "false"
      enable_custom_domain_in_emails         = "false"
      enable_dynamic_client_registration     = "false"
      enable_idtoken_api2                    = "false"
      enable_legacy_logs_search_v2           = "false"
      enable_legacy_profile                  = "false"
      enable_pipeline2                       = "false"
      enable_public_signup_user_exists_error = "false"
      no_disclose_enterprise_connections     = "false"
      revoke_refresh_token_grant             = "false"
      universal_login                        = "true"
      use_scope_descriptions_for_consent     = "false"
    }
  }
}
module "auth0-tenant" {
  source   = "./modules/auth0-tenant"
  for_each = { for v in var.tenant : v.friendly_name => v }

  friendly_name           = each.value.friendly_name
  allowed_logout_urls     = lookup(each.value, "allowed_logout_urls", null)
  default_audience        = lookup(each.value, "default_audience", null)
  picture_url             = lookup(each.value, "picture_url", null)
  enabled_locales         = lookup(each.value, "enabled_locales", null)
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
  universal_login         = lookup(each.value, "universal_login", [])
  flags                   = lookup(each.value, "flags", local.tenant.flags)
}
