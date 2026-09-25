variable "domain" {
  type        = string
  description = "Hostname to configure as an Auth0 custom domain."
}

variable "type" {
  type        = string
  default     = "auth0_managed_certs"
  description = "Certificate management type for the custom domain."

  validation {
    condition     = contains(["auth0_managed_certs", "self_managed_certs"], var.type)
    error_message = "type must be auth0_managed_certs or self_managed_certs."
  }
}

variable "tls_policy" {
  type        = string
  default     = "recommended"
  description = "TLS policy for Auth0-managed certificates."

  validation {
    condition     = contains(["compatible", "recommended"], var.tls_policy)
    error_message = "tls_policy must be compatible or recommended."
  }
}

variable "domain_metadata" {
  type        = map(string)
  default     = {}
  description = "Metadata to associate with the custom domain."
}

variable "relying_party_identifier" {
  type        = string
  default     = null
  description = "Optional relying party identifier for the custom domain."
}
