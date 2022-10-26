variable "application_name" {
  description = "Auth0 Application name."
  type        = string
  default     = "Auth0"
}

variable "app_type" {
  description = "Auth0 Application App-type."
  type        = string
  default     = "regular_web"
  validation {
    condition     = contains(["Native", "spa", "regular_web", "non_interactive", "sso_integration"], var.app_type)
    error_message = "The valid attributes are [Native], [spa], [regular_web], [non_interactive], [sso_integration]"
  }
}

variable "custom_login_page" {
  description = "Auth0 Application custom login page."
  type        = string
  default     = ""
}

variable "custom_login_page_on" {
  description = "Indicates whether a custom login page is to be used."
  type        = bool
  default     = true
}

variable "is_first_party" {
  description = "Indicates whether this client is a first-party client"
  type        = bool
  default     = true
}

variable "is_trusted_endpoint" {
  description = "Indicates whether the token endpoint IP header is trusted."
  type        = bool
  default     = false
}


variable "token_endpoint_auth_method" {
  description = "Defines the requested authentication method for the token endpoint."
  type        = string
  default     = "none"
}

variable "cross_origin_auth" {
  description = "Whether this client can be used to make cross-origin authentication requests (true) or it is not allowed to make such requests (false)."
  type        = bool
  default     = false
}

variable "oidc_conformant" {
  description = "Indicates whether this client will conform to strict OIDC specifications."
  type        = bool
  default     = true
}

variable "callbacks" {
  description = "URLs that Auth0 may call back to after a user authenticates for the client."
  type        = list(string)
  default     = []
}

variable "allowed_origins" {
  description = "URLs that represent valid origins for cross-origin resource sharing."
  type        = list(string)
  default     = []
}

variable "allowed_logout_urls" {
  description = "URLs that Auth0 may redirect to after logout."
  type        = list(string)
  default     = []
}

variable "web_origins" {
  description = "URLs that represent valid web origins for use with web message response mode."
  type        = list(string)
  default     = []
}

variable "organization_require_behavior" {
  description = "Defines how to proceed during an authentication transaction."
  type        = string
  default     = null
}

variable "organization_usage" {
  description = "Defines how to sproceed during an authentication transaction with regards to an organization."
  type        = string
  default     = null
}

variable "grant_types" {
  description = "Types of grants that this client is authorized to use."
  type        = list(string)
  default     = []
}

variable "client_metadata" {
  description = "Metadata associated with the client, in the form of an object with string values (max 255 chars)."
  type        = map(string)
  default     = {}
}

variable "jwt_configuration" {
  description = "Configuration settings for the JWTs issued for this client."
  type = object({
    lifetime_in_seconds = number
    secret_encoded      = bool
    alg                 = string
  })
  default = ({
    lifetime_in_seconds = 3600
    secret_encoded      = false
    alg                 = "RS256"
  })
}

variable "refresh_token" {
  description = "Configuration settings for the refresh tokens issued for this client."
  type = object({
    leeway                       = number
    token_lifetime               = number
    rotation_type                = string
    expiration_type              = string
    idle_token_lifetime          = number
    infinite_idle_token_lifetime = bool
    infinite_token_lifetime      = bool
  })
  default = ({
    leeway                       = 0
    token_lifetime               = 31557600
    rotation_type                = "non-rotating"
    expiration_type              = "non-expiring"
    idle_token_lifetime          = 2592000
    infinite_idle_token_lifetime = true
    infinite_token_lifetime      = true
  })
}

variable "sso" {
  description = "Applies only to SSO clients and determines whether Auth0 will handle Single Sign-On (true) or whether the identity provider will (false)."
  type        = bool
  default     = false
}

variable "sso_disabled" {
  description = "Indicates whether or not SSO is disabled."
  type        = bool
  default     = false
}
