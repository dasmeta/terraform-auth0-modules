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

// Tenant
variable "tenant" {
  type = list(any)
  default = [{
    friendly_name           = ""
    default_redirection_uri = ""
    idle_session_lifetime   = "0"
    session_lifetime        = "0"

    change_password = {
      enabled = "true"
      html    = ""
    }
    guardian_mfa_page = {
      enabled = "true"
      html    = ""
    }
    }
  ]
  description = "With this resource, you can manage Auth0 tenants"
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
