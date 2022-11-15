variable "friendly_name" {
  description = "Friendly name for the tenant."
  type        = string
  default     = "Tenant Name"
}

variable "picture_url" {
  description = "URL of logo to be shown for the tenant. Recommended size is 150px x 150px."
  type        = string
  default     = "http://example.com/logo.png"
}

variable "support_email" {
  description = "Support email address for authenticating users."
  type        = string
  default     = null
}

variable "support_url" {
  description = "Support URL for authenticating users."
  type        = string
  default     = null
}

variable "allowed_logout_urls" {
  description = "URLs that Auth0 may redirect to after logout."
  type        = list(string)
  default     = []
}

variable "session_lifetime" {
  description = "Number of hours during which a session will stay valid."
  type        = number
  default     = 720
}

variable "idle_session_lifetime" {
  description = "Number of hours during which a session will stay valid."
  type        = number
  default     = 720
}

variable "sandbox_version" {
  description = "Selected sandbox version for the extensibility environment, which allows you to use custom scripts to extend parts of Auth0's functionality."
  type        = string
  default     = "12"
}

variable "enabled_locales" {
  description = "Supported locales for the user interface."
  type        = list(string)
  default     = ["en"]
}

variable "default_redirection_uri" {
  description = "The default absolute redirection URI, must be https and cannot contain a fragment."
  type        = string
  default     = "https://example.com/login"
}
variable "change_password" {
  description = "Password change configuration"
  type = list(object({
    enabled = bool
    html    = string
  }))
  default = []
}

variable "guardian_mfa_page" {
  description = "Configuration settings for the Guardian MFA page."
  type = list(object({
    enabled = bool
    html    = string
  }))
  default = []
}

variable "error_page" {
  description = "Configuration settings for error pages."
  type = list(object({
    html          = string
    show_log_link = bool
    url           = string
  }))
  default = []
}

variable "session_cookie" {
  description = "Alters behavior of tenant's session cookie."
  type        = string
  default     = "persistent"
}

variable "universal_login" {
  description = "Configuration settings for Universal Login."
  type = list(object({
    colors = object({
      primary         = string
      page_background = string
    })
  }))
  default = []
}

variable "flags" {
  description = "Configuration settings for tenant flags."
  type = object({
    allow_legacy_delegation_grant_types    = bool
    allow_legacy_ro_grant_types            = bool
    allow_legacy_tokeninfo_endpoint        = bool
    dashboard_insights_view                = bool
    dashboard_log_streams_next             = bool
    disable_clickjack_protection_headers   = bool
    disable_fields_map_fix                 = bool
    disable_management_api_sms_obfuscation = bool
    enable_adfs_waad_email_verification    = bool
    enable_apis_section                    = bool
    enable_client_connections              = bool
    enable_custom_domain_in_emails         = bool
    enable_dynamic_client_registration     = bool
    enable_idtoken_api2                    = bool
    enable_legacy_logs_search_v2           = bool
    enable_legacy_profile                  = bool
    enable_pipeline2                       = bool
    enable_public_signup_user_exists_error = bool
    no_disclose_enterprise_connections     = bool
    revoke_refresh_token_grant             = bool
    universal_login                        = bool
    use_scope_descriptions_for_consent     = bool
  })
  default = ({
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
  })
}

variable "default_directory" {
  type    = string
  default = null
}

# // Auth0
# variable "domain" {
#   type        = string
#   description = "Auth0 domain"
# }

# variable "client-id" {
#   type        = string
#   description = "Auth0 client id"
# }

# variable "client-secret" {
#   type        = string
#   description = "Auth0 client secret"
# }

// Action
variable "actions" {
  type        = any
  default     = []
  description = "Actions are secure, tenant-specific, versioned functions written in Node.js that execute at certain points during the Auth0 runtime. Actions are used to customize and extend Auth0's capabilities with custom logic."
}

// Client
variable "clients" {
  type        = any
  default     = []
  description = "With this resource, you can set up applications that use Auth0 for authentication and configure allowed callback URLs and secrets for these applications."
}

variable "client_grants" {
  type        = any
  default     = []
  description = "Auth0 uses various grant types, or methods by which you grant limited access to your resources to another entity without exposing credentials."
}

// API
variable "apis" {
  type        = any
  default     = []
  description = "With this resource, you can set up APIs that can be consumed from your authorized applications."
}

// Role
variable "roles" {
  type = list(any)
  default = [{
    name        = "Administrator"
    description = "Administrator role"
    permissions = []
    }
  ]
  description = "With this resource, you can create and manage collections of permissions that can be assigned to users, which are otherwise known as roles."
}

// Auth0 Auth0 org
variable "orgs" {
  type        = any
  default     = []
  description = "The Organizations feature represents a broad update to the Auth0 platform that allows our business-to-business (B2B) customers to better manage their partners and customer"
}

// Auth0 Prompt
variable "prompts" {
  type        = any
  default     = []
  description = "With this resource, you can manage your Auth0 prompts, including choosing the login experience version."
}

// Auth0 db
variable "db_connections" {
  type        = any
  default     = []
  description = "With Auth0, you can define sources of users, otherwise known as connections, which may include identity providers database authentication methods."
}

// Auth0 Google
variable "google" {
  type        = any
  default     = []
  description = "With Auth0, you can define sources of users, otherwise known as connections, which may include identity provider Google  authentication methods."
}

// Email
variable "emails" {
  type        = any
  default     = []
  description = "With Auth0, you can have standard welcome, password reset, and account verification email-based workflows built right into Auth0."
}
