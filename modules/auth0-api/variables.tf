variable "name" {
  description = "Friendly name for the resource server."
  type        = string
  default     = "My Resource Server (Managed by Terraform)"
}

variable "identifier" {
  description = "Unique identifier for the resource server."
  type        = string
  default     = "my-resource-server-identifier"
}

variable "signing_alg" {
  description = "Algorithm used to sign JWTs."
  type        = string
  default     = "RS256"
}

variable "token_lifetime" {
  description = "Number of seconds during which access tokens issued for this resource server from the token endpoint remain valid."
  type        = number
  default     = 86400
}

variable "token_lifetime_for_web" {
  description = "Number of seconds during which access tokens issued for this resource server via implicit or hybrid flows remain valid. Cannot be greater than the token_lifetime value."
  type        = number
  default     = 7200
}

variable "skip_consent_for_verifiable_first_party_clients" {
  description = "Indicates whether to skip user consent for applications flagged as first party."
  type        = bool
  default     = true
}

variable "enforce_policies" {
  description = "Indicates whether authorization polices are enforced."
  type        = bool
  default     = true
}

variable "token_dialect" {
  description = "Dialect of access tokens that should be issued for this resource server. Options include access_token or access_token_authz (includes permissions)."
  type        = string
  default     = null
}
variable "scopes" {
  description = "List of permissions (scopes) used by this resource server."
  type = list(object({
    value       = string
    description = string
  }))
  default = [({
    value       = "read:something"
    description = "read something"
  })]
}
