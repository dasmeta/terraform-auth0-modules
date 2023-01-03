### `Auth0 Tenant` minimal usage
```
module "auth0-tenant" {
  source = "dasmeta/modules/auth0//modules/auth0-tenant"
}

terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.40.0"
    }
  }
}

provider "auth0" {
  domain        = "auth0-domain"
  client_id     = "client-id"
  client_secret = "client-secret"
}
```
### `Auth0 Tenant` all parameters usage
```
module "auth0-tenant" {
  source = "../../terraform-auth0-modules/modules/auth0-tenant"

  friendly_name = "Tenant"
  picture_url = "http://example.com/logo.png"
  support_email = "support@example.com"
  support_url = "http://example.com/support"
  allowed_logout_urls = ["http://example.com/logout"]
  session_lifetime = 168
  idle_session_lifetime = 72
  sandbox_version = "16"
  enabled_locales = ["en"]
  default_redirection_uri = "https://example.com/login"
  change_password = [{
    enabled = true
    html = "html code"
  }]

  guardian_mfa_page = [{
      enabled = true
      html    = "html code"
  }]

  error_page = [{
    html = "html code"
    show_log_link = true
    url = "https://example.com"
    }
  ]

  session_cookie = "non-persistent"

  universal_login = [{
      colors = {
        primary         = "#0059d6"
        page_background = "#000000"
      }
    }
  ]

  flags = {
    universal_login                        = true
    disable_clickjack_protection_headers   = true
    enable_public_signup_user_exists_error = true
    use_scope_descriptions_for_consent     = true
    no_disclose_enterprise_connections     = false
    disable_management_api_sms_obfuscation = false
    disable_fields_map_fix                 = false
  }
}

terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.34.0"
    }
  }
}

provider "auth0" {
  domain        = "auth0-domain"
  client_id     = "client-id"
  client_secret = "client-secret"
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~>0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~>0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_tenant.my_tenant](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/tenant) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_logout_urls"></a> [allowed\_logout\_urls](#input\_allowed\_logout\_urls) | URLs that Auth0 may redirect to after logout. | `list(string)` | `[]` | no |
| <a name="input_change_password"></a> [change\_password](#input\_change\_password) | Password change configuration | <pre>list(object({<br>    enabled = bool<br>    html    = string<br>  }))</pre> | `[]` | no |
| <a name="input_default_audience"></a> [default\_audience](#input\_default\_audience) | API Audience to use by default for API Authorization flows. This setting is equivalent to appending the audience to every authorization request made to the tenant for every application. | `string` | `null` | no |
| <a name="input_default_directory"></a> [default\_directory](#input\_default\_directory) | n/a | `string` | `null` | no |
| <a name="input_default_redirection_uri"></a> [default\_redirection\_uri](#input\_default\_redirection\_uri) | The default absolute redirection URI, must be https and cannot contain a fragment. | `string` | `"https://example.com/login"` | no |
| <a name="input_enabled_locales"></a> [enabled\_locales](#input\_enabled\_locales) | Supported locales for the user interface. | `list(string)` | <pre>[<br>  "en"<br>]</pre> | no |
| <a name="input_error_page"></a> [error\_page](#input\_error\_page) | Configuration settings for error pages. | <pre>list(object({<br>    html          = string<br>    show_log_link = bool<br>    url           = string<br>  }))</pre> | `[]` | no |
| <a name="input_flags"></a> [flags](#input\_flags) | Configuration settings for tenant flags. | <pre>object({<br>    allow_legacy_delegation_grant_types    = bool<br>    allow_legacy_ro_grant_types            = bool<br>    allow_legacy_tokeninfo_endpoint        = bool<br>    dashboard_insights_view                = bool<br>    dashboard_log_streams_next             = bool<br>    disable_clickjack_protection_headers   = bool<br>    disable_fields_map_fix                 = bool<br>    disable_management_api_sms_obfuscation = bool<br>    enable_adfs_waad_email_verification    = bool<br>    enable_apis_section                    = bool<br>    enable_client_connections              = bool<br>    enable_custom_domain_in_emails         = bool<br>    enable_dynamic_client_registration     = bool<br>    enable_idtoken_api2                    = bool<br>    enable_legacy_logs_search_v2           = bool<br>    enable_legacy_profile                  = bool<br>    enable_pipeline2                       = bool<br>    enable_public_signup_user_exists_error = bool<br>    no_disclose_enterprise_connections     = bool<br>    revoke_refresh_token_grant             = bool<br>    universal_login                        = bool<br>    use_scope_descriptions_for_consent     = bool<br>  })</pre> | <pre>{<br>  "allow_legacy_delegation_grant_types": "false",<br>  "allow_legacy_ro_grant_types": "false",<br>  "allow_legacy_tokeninfo_endpoint": "false",<br>  "dashboard_insights_view": "false",<br>  "dashboard_log_streams_next": "false",<br>  "disable_clickjack_protection_headers": "false",<br>  "disable_fields_map_fix": "false",<br>  "disable_management_api_sms_obfuscation": "false",<br>  "enable_adfs_waad_email_verification": "false",<br>  "enable_apis_section": "false",<br>  "enable_client_connections": "false",<br>  "enable_custom_domain_in_emails": "false",<br>  "enable_dynamic_client_registration": "false",<br>  "enable_idtoken_api2": "false",<br>  "enable_legacy_logs_search_v2": "false",<br>  "enable_legacy_profile": "false",<br>  "enable_pipeline2": "false",<br>  "enable_public_signup_user_exists_error": "false",<br>  "no_disclose_enterprise_connections": "false",<br>  "revoke_refresh_token_grant": "false",<br>  "universal_login": "true",<br>  "use_scope_descriptions_for_consent": "false"<br>}</pre> | no |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | Friendly name for the tenant. | `string` | `"Tenant Name"` | no |
| <a name="input_guardian_mfa_page"></a> [guardian\_mfa\_page](#input\_guardian\_mfa\_page) | Configuration settings for the Guardian MFA page. | <pre>list(object({<br>    enabled = bool<br>    html    = string<br>  }))</pre> | `[]` | no |
| <a name="input_idle_session_lifetime"></a> [idle\_session\_lifetime](#input\_idle\_session\_lifetime) | Number of hours during which a session can be inactive before the user must log in again. | `number` | `72` | no |
| <a name="input_picture_url"></a> [picture\_url](#input\_picture\_url) | URL of logo to be shown for the tenant. Recommended size is 150px x 150px. | `string` | `"http://example.com/logo.png"` | no |
| <a name="input_sandbox_version"></a> [sandbox\_version](#input\_sandbox\_version) | Selected sandbox version for the extensibility environment, which allows you to use custom scripts to extend parts of Auth0's functionality. | `string` | `"12"` | no |
| <a name="input_session_cookie"></a> [session\_cookie](#input\_session\_cookie) | Alters behavior of tenant's session cookie. | `string` | `"persistent"` | no |
| <a name="input_session_lifetime"></a> [session\_lifetime](#input\_session\_lifetime) | Number of hours during which a session will stay valid. | `number` | `168` | no |
| <a name="input_support_email"></a> [support\_email](#input\_support\_email) | Support email address for authenticating users. | `string` | `null` | no |
| <a name="input_support_url"></a> [support\_url](#input\_support\_url) | Support URL for authenticating users. | `string` | `null` | no |
| <a name="input_universal_login"></a> [universal\_login](#input\_universal\_login) | Configuration settings for Universal Login. | <pre>list(object({<br>    colors = object({<br>      primary         = string<br>      page_background = string<br>    })<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth0-tenant"></a> [auth0-tenant](#output\_auth0-tenant) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
