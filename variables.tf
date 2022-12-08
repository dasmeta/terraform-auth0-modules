// Auth0
variable "domain" {
  type        = string
  description = "Auth0 domain"
}

variable "client-id" {
  type        = string
  description = "Auth0 client id"
}

variable "client-secret" {
  type        = string
  description = "Auth0 client secret"
}

// Action

variable "actions" {
  type = list(object({
    name    = string
    code    = string
    runtime = optional(string, "node16")
    supported_triggers = optional(any, {
      id      = "post-change-password"
      version = "v2"
    })
    dependencies = optional(list(any), [])
    deploy       = optional(bool, false)
  }))
  default     = []
  description = "Actions are secure, tenant-specific, versioned functions written in Node.js that execute at certain points during the Auth0 runtime. Actions are used to customize and extend Auth0's capabilities with custom logic."
}

// Client
variable "clients" {
  type = list(object({

    name                          = string
    app_type                      = string
    cross_origin_auth             = optional(bool, false)
    allowed_logout_urls           = optional(list(string), [])
    allowed_origins               = optional(list(string), [])
    callbacks                     = optional(list(string), [])
    web_origins                   = optional(list(string), [])
    organization_usage            = optional(string, null)
    organization_require_behavior = optional(string, null)
    custom_login_page_on          = optional(bool, true)
    custom_login_page             = optional(string, "")
    token_endpoint_auth_method    = optional(string, "none")
    grant_types                   = optional(list(string), ["client_credentials"])
    token_endpoint_auth_method    = optional(string, "client_secret_post")
    logo_uri                      = optional(string, null)
    sso                           = optional(bool, false)
    jwt_configuration = optional(any, {
      alg                 = "RS256"
      lifetime_in_seconds = "36000"
      secret_encoded      = "false"
    })
    refresh_token = optional(any, {
      expiration_type              = "non-expiring"
      idle_token_lifetime          = "2592000"
      infinite_idle_token_lifetime = "true"
      infinite_token_lifetime      = "true"
      leeway                       = "0"
      rotation_type                = "non-rotating"
      token_lifetime               = "31557600"
    })
  }))

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
  type = list(object({
    name                                            = string
    scopes                                          = list(any)
    identifier                                      = string
    enforce_policies                                = optional(bool, true)
    signing_alg                                     = optional(string, "RS256")
    skip_consent_for_verifiable_first_party_clients = optional(bool, true)
    token_lifetime                                  = optional(number, 86400)
    token_lifetime_for_web                          = optional(number, 7200)
    token_dialect                                   = optional(string, null)
  }))

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

// Tenant
variable "tenant" {
  type = list(object({
    friendly_name           = string
    allowed_logout_urls     = optional(list(string), [])
    default_audience        = optional(string, null)
    picture_url             = optional(string, null)
    enabled_locales         = optional(list(string), null)
    change_password         = optional(list(any), [])
    guardian_mfa_page       = optional(list(any), [])
    default_redirection_uri = string
    sandbox_version         = string
    error_page              = optional(list(any), [])
    default_directory       = optional(string, null)
    support_email           = optional(string, null)
    support_url             = optional(string, null)
    session_lifetime        = optional(number, 168)
    idle_session_lifetime   = optional(number, 72)
    session_cookie          = optional(string, "persistent")
    universal_login         = optional(list(any), [])
    flags = optional(any, {
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

  }))



  default     = []
  description = "With this resource, you can manage Auth0 tenants"
}

// Auth0 Auth0 org

variable "orgs" {
  type = list(object({
    name         = string
    display_name = string

    branding    = optional(list(any), [])
    connections = optional(list(any), [])
  }))

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
  type = list(object({
    name                      = string
    password_policy           = optional(string, "good")
    password_history          = optional(any, { enable = true, size = 3 })
    password_no_personal_info = optional(bool, true)
    password_dictionary       = optional(any, { enable = true, dictionary = [] })
    brute_force_protection    = optional(bool, true)
  }))
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
  type = list(object({
    name                 = string
    default_from_address = string
    access_key_id        = optional(string, null)
    secret_access_key    = optional(string, null)
    region               = optional(string, null)
    api_key              = optional(string, null)
    email_template       = optional(any, {})
  }))
  default     = []
  description = "With Auth0, you can have standard welcome, password reset, and account verification email-based workflows built right into Auth0."
}

// Users

variable "users" {
  default = []
  type = list(object({
    name     = string
    email    = string
    roles    = list(string)
    password = string
  }))
}

// MFA
variable "mfa" {
  type = list(object({
    policy           = optional(string, "all-applications")
    email            = optional(bool, false)
    otp              = optional(bool, false)
    recovery_code    = optional(bool, false)
    webauthn_roaming = optional(list(any), [])
    phone            = optional(list(any), [])
    push             = optional(list(any), [])
    duo              = optional(list(any), [])
  }))
  default     = []
  description = "Multi-Factor Authentication works by requiring additional factors during the login process to prevent unauthorized access."
}
