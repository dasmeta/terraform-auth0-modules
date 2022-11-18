resource "auth0_tenant" "my_tenant" {
  allowed_logout_urls = var.allowed_logout_urls
  default_directory   = var.default_directory
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
        primary         = var.universal_login.colors.primary
        page_background = var.universal_login.colors.primary
      }
    }
  }

  flags {
    universal_login                        = var.flags.universal_login
    disable_clickjack_protection_headers   = var.flags.disable_clickjack_protection_headers
    enable_public_signup_user_exists_error = var.flags.enable_public_signup_user_exists_error
    use_scope_descriptions_for_consent     = var.flags.use_scope_descriptions_for_consent
    no_disclose_enterprise_connections     = var.flags.no_disclose_enterprise_connections
    disable_management_api_sms_obfuscation = var.flags.disable_management_api_sms_obfuscation
    disable_fields_map_fix                 = var.flags.disable_fields_map_fix
  }
}
