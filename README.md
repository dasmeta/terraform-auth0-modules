# terraform-auth0-modules
### This module  allow you to create and manage clients, resource servers(api), client grants, connections, email providers and  rules and  roles, tenants as part of a Terraform deployment.

## Example
[Auth0 multi resources create] (https://github.com/dasmeta/terraform-auth0-modules/tree/main/examples)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~> 0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~> 0.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_action"></a> [action](#module\_action) | ./modules/auth0-action | n/a |
| <a name="module_auth0-auth-db"></a> [auth0-auth-db](#module\_auth0-auth-db) | ./modules/auth0-auth-db | n/a |
| <a name="module_auth0-email"></a> [auth0-email](#module\_auth0-email) | ./modules/auth0-email | n/a |
| <a name="module_auth0-goa"></a> [auth0-goa](#module\_auth0-goa) | ./modules/auth0-auth-google | n/a |
| <a name="module_auth0-guardian"></a> [auth0-guardian](#module\_auth0-guardian) | ./modules/auth0-guardian | n/a |
| <a name="module_auth0-org"></a> [auth0-org](#module\_auth0-org) | ./modules/auth0-org | n/a |
| <a name="module_auth0-tenant"></a> [auth0-tenant](#module\_auth0-tenant) | ./modules/auth0-tenant | n/a |
| <a name="module_auth0_api"></a> [auth0\_api](#module\_auth0\_api) | ./modules/auth0-api | n/a |
| <a name="module_auth0_client"></a> [auth0\_client](#module\_auth0\_client) | ./modules/auth0-client | n/a |
| <a name="module_auth0_role"></a> [auth0\_role](#module\_auth0\_role) | ./modules/auth0-role | n/a |
| <a name="module_auth0_users"></a> [auth0\_users](#module\_auth0\_users) | ./modules/auth0-user/ | n/a |

## Resources

| Name | Type |
|------|------|
| [auth0_client_grant.my_client_grant](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/client_grant) | resource |
| [auth0_prompt.my_prompt](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/prompt) | resource |
| [auth0_trigger_binding.trigger_binding](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/trigger_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions"></a> [actions](#input\_actions) | Actions are secure, tenant-specific, versioned functions written in Node.js that execute at certain points during the Auth0 runtime. Actions are used to customize and extend Auth0's capabilities with custom logic. | <pre>list(object({<br>    name    = string<br>    code    = string<br>    runtime = optional(string, "node16")<br>    supported_triggers = optional(any, {<br>      id      = "post-change-password"<br>      version = "v2"<br>    })<br>    dependencies = optional(list(any), [])<br>    deploy       = optional(bool, false)<br>  }))</pre> | `[]` | no |
| <a name="input_apis"></a> [apis](#input\_apis) | With this resource, you can set up APIs that can be consumed from your authorized applications. | <pre>list(object({<br>    name                                            = string<br>    scopes                                          = list(any)<br>    identifier                                      = string<br>    enforce_policies                                = optional(bool, true)<br>    signing_alg                                     = optional(string, "RS256")<br>    skip_consent_for_verifiable_first_party_clients = optional(bool, true)<br>    token_lifetime                                  = optional(number, 86400)<br>    token_lifetime_for_web                          = optional(number, 7200)<br>    token_dialect                                   = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_client-id"></a> [client-id](#input\_client-id) | Auth0 client id | `string` | n/a | yes |
| <a name="input_client-secret"></a> [client-secret](#input\_client-secret) | Auth0 client secret | `string` | n/a | yes |
| <a name="input_client_grants"></a> [client\_grants](#input\_client\_grants) | Auth0 uses various grant types, or methods by which you grant limited access to your resources to another entity without exposing credentials. | `any` | `[]` | no |
| <a name="input_clients"></a> [clients](#input\_clients) | With this resource, you can set up applications that use Auth0 for authentication and configure allowed callback URLs and secrets for these applications. | <pre>list(object({<br><br>    name                          = string<br>    app_type                      = string<br>    cross_origin_auth             = optional(bool, false)<br>    allowed_logout_urls           = optional(list(string), [])<br>    allowed_origins               = optional(list(string), [])<br>    callbacks                     = optional(list(string), [])<br>    web_origins                   = optional(list(string), [])<br>    organization_usage            = optional(string, null)<br>    organization_require_behavior = optional(string, null)<br>    custom_login_page_on          = optional(bool, true)<br>    custom_login_page             = optional(string, "")<br>    token_endpoint_auth_method    = optional(string, "none")<br>    grant_types                   = optional(list(string), ["client_credentials"])<br>    token_endpoint_auth_method    = optional(string, "client_secret_post")<br>    logo_uri                      = optional(string, null)<br>    sso                           = optional(bool, false)<br>    jwt_configuration = optional(any, {<br>      alg                 = "RS256"<br>      lifetime_in_seconds = "36000"<br>      secret_encoded      = "false"<br>    })<br>    refresh_token = optional(any, {<br>      expiration_type              = "non-expiring"<br>      idle_token_lifetime          = "2592000"<br>      infinite_idle_token_lifetime = "true"<br>      infinite_token_lifetime      = "true"<br>      leeway                       = "0"<br>      rotation_type                = "non-rotating"<br>      token_lifetime               = "31557600"<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_db_connections"></a> [db\_connections](#input\_db\_connections) | With Auth0, you can define sources of users, otherwise known as connections, which may include identity providers database authentication methods. | <pre>list(object({<br>    name                      = string<br>    password_policy           = optional(string, "good")<br>    password_history          = optional(any, { enable = true, size = 3 })<br>    password_no_personal_info = optional(bool, true)<br>    password_dictionary       = optional(any, { enable = true, dictionary = [] })<br>    brute_force_protection    = optional(bool, true)<br>  }))</pre> | `[]` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Auth0 domain | `string` | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | With Auth0, you can have standard welcome, password reset, and account verification email-based workflows built right into Auth0. | <pre>list(object({<br>    name                 = string<br>    default_from_address = string<br>    access_key_id        = optional(string, null)<br>    secret_access_key    = optional(string, null)<br>    region               = optional(string, null)<br>    api_key              = optional(string, null)<br>    email_template       = optional(any, {})<br>  }))</pre> | `[]` | no |
| <a name="input_google"></a> [google](#input\_google) | With Auth0, you can define sources of users, otherwise known as connections, which may include identity provider Google  authentication methods. | `any` | `[]` | no |
| <a name="input_mfa"></a> [mfa](#input\_mfa) | Multi-Factor Authentication works by requiring additional factors during the login process to prevent unauthorized access. | <pre>list(object({<br>    policy           = optional(string, "all-applications")<br>    email            = optional(bool, false)<br>    otp              = optional(bool, false)<br>    recovery_code    = optional(bool, false)<br>    webauthn_roaming = optional(list(any), [])<br>    phone            = optional(list(any), [])<br>    push             = optional(list(any), [])<br>    duo              = optional(list(any), [])<br>  }))</pre> | `[]` | no |
| <a name="input_orgs"></a> [orgs](#input\_orgs) | The Organizations feature represents a broad update to the Auth0 platform that allows our business-to-business (B2B) customers to better manage their partners and customer | <pre>list(object({<br>    name         = string<br>    display_name = string<br><br>    branding    = optional(list(any), [])<br>    connections = optional(list(any), [])<br>  }))</pre> | `[]` | no |
| <a name="input_prompts"></a> [prompts](#input\_prompts) | With this resource, you can manage your Auth0 prompts, including choosing the login experience version. | `any` | `[]` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | With this resource, you can create and manage collections of permissions that can be assigned to users, which are otherwise known as roles. | `list(any)` | <pre>[<br>  {<br>    "description": "Administrator role",<br>    "name": "Administrator",<br>    "permissions": []<br>  }<br>]</pre> | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | With this resource, you can manage Auth0 tenants | <pre>list(object({<br>    friendly_name           = string<br>    allowed_logout_urls     = optional(list(string), [])<br>    default_audience        = optional(string, null)<br>    picture_url             = optional(string, null)<br>    enabled_locales         = optional(list(string), null)<br>    change_password         = optional(list(any), [])<br>    guardian_mfa_page       = optional(list(any), [])<br>    default_redirection_uri = string<br>    sandbox_version         = string<br>    error_page              = optional(list(any), [])<br>    default_directory       = optional(string, null)<br>    support_email           = optional(string, null)<br>    support_url             = optional(string, null)<br>    session_lifetime        = optional(number, 168)<br>    idle_session_lifetime   = optional(number, 72)<br>    session_cookie          = optional(string, "persistent")<br>    universal_login         = optional(list(any), [])<br>    flags = optional(any, {<br>      allow_legacy_delegation_grant_types    = "false"<br>      allow_legacy_ro_grant_types            = "false"<br>      allow_legacy_tokeninfo_endpoint        = "false"<br>      dashboard_insights_view                = "false"<br>      dashboard_log_streams_next             = "false"<br>      disable_clickjack_protection_headers   = "false"<br>      disable_fields_map_fix                 = "false"<br>      disable_management_api_sms_obfuscation = "false"<br>      enable_adfs_waad_email_verification    = "false"<br>      enable_apis_section                    = "false"<br>      enable_client_connections              = "false"<br>      enable_custom_domain_in_emails         = "false"<br>      enable_dynamic_client_registration     = "false"<br>      enable_idtoken_api2                    = "false"<br>      enable_legacy_logs_search_v2           = "false"<br>      enable_legacy_profile                  = "false"<br>      enable_pipeline2                       = "false"<br>      enable_public_signup_user_exists_error = "false"<br>      no_disclose_enterprise_connections     = "false"<br>      revoke_refresh_token_grant             = "false"<br>      universal_login                        = "true"<br>      use_scope_descriptions_for_consent     = "false"<br>    })<br><br>  }))</pre> | `[]` | no |
| <a name="input_users"></a> [users](#input\_users) | n/a | <pre>list(object({<br>    name     = string<br>    email    = string<br>    roles    = list(string)<br>    password = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_credentials"></a> [client\_credentials](#output\_client\_credentials) | Client credentials for each client created. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
