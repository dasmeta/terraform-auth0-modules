resource "auth0_tenant" "my_tenant" {
  default_audience        = var.default_audience
  picture_url             = var.picture_url
  allowed_logout_urls     = var.allowed_logout_urls
  default_directory       = var.default_directory
  session_lifetime        = var.session_lifetime
  sandbox_version         = var.sandbox_version
  enabled_locales         = var.enabled_locales
  default_redirection_uri = var.default_redirection_uri
  idle_session_lifetime   = var.idle_session_lifetime

  support_url   = var.support_url
  support_email = var.support_email
  friendly_name = var.friendly_name

  dynamic "change_password" {
    for_each = var.change_password
    content {
      enabled = var.change_password[0].enabled
      html    = var.change_password[0].html
    }
  }

  dynamic "guardian_mfa_page" {
    for_each = var.guardian_mfa_page
    content {
      enabled = var.guardian_mfa_page[0].enabled
      html    = var.guardian_mfa_page[0].html
    }
  }

  dynamic "error_page" {
    for_each = var.error_page
    content {
      html          = var.error_page[0].html
      show_log_link = var.error_page[0].show_log_link
      url           = var.error_page[0].url
    }
  }

  #  dynamic session_cookie {
  #    for_each = var.session_cookie
  #    content {
  #      mode = var.session_cookie
  #    }
  #  }

  session_cookie {
    mode = var.session_cookie
  }

  dynamic "universal_login" {
    for_each = var.universal_login
    content {
      colors {
        primary         = var.universal_login[0].colors.primary
        page_background = var.universal_login[0].colors.page_background
      }
    }
  }

  flags {
    allow_legacy_delegation_grant_types    = var.flags.allow_legacy_delegation_grant_types
    allow_legacy_ro_grant_types            = var.flags.allow_legacy_ro_grant_types
    allow_legacy_tokeninfo_endpoint        = var.flags.allow_legacy_tokeninfo_endpoint
    dashboard_insights_view                = var.flags.dashboard_insights_view
    dashboard_log_streams_next             = var.flags.dashboard_log_streams_next
    disable_clickjack_protection_headers   = var.flags.disable_clickjack_protection_headers
    disable_fields_map_fix                 = var.flags.disable_fields_map_fix
    disable_management_api_sms_obfuscation = var.flags.disable_management_api_sms_obfuscation
    enable_adfs_waad_email_verification    = var.flags.enable_adfs_waad_email_verification
    enable_apis_section                    = var.flags.enable_apis_section
    enable_client_connections              = var.flags.enable_client_connections
    enable_custom_domain_in_emails         = var.flags.enable_custom_domain_in_emails
    enable_dynamic_client_registration     = var.flags.enable_dynamic_client_registration
    enable_idtoken_api2                    = var.flags.enable_idtoken_api2
    enable_legacy_logs_search_v2           = var.flags.enable_legacy_logs_search_v2
    enable_legacy_profile                  = var.flags.enable_legacy_profile
    enable_pipeline2                       = var.flags.enable_pipeline2
    enable_public_signup_user_exists_error = var.flags.enable_public_signup_user_exists_error
    no_disclose_enterprise_connections     = var.flags.no_disclose_enterprise_connections
    revoke_refresh_token_grant             = var.flags.revoke_refresh_token_grant
    universal_login                        = var.flags.universal_login
    use_scope_descriptions_for_consent     = var.flags.use_scope_descriptions_for_consent
  }
}
