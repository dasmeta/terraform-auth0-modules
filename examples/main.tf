locals {
  configs = module.auth0_configs.merged
}

module "auth0_configs" {
  source  = "Invicton-Labs/deepmerge/null"
  version = "0.1.5"
  maps = [
    local._defaults,
    local.envs["dev"]
  ]
}

module "auth0" {
  source  = "dasmeta/modules/auth0"
  version = "1.1.7"

  domain        = "*********"
  client-id     = "*********"
  client-secret = "*********"

  // Role
  roles = [for item in lookup(local.configs, "roles", []) : item]

  // Tenant
  tenant = [for item in lookup(local.configs, "tenant", []) : item]

  // Api
  apis = [for item in lookup(local.configs, "apis", {}) : item]

  // Action
  actions = [for item in lookup(local.configs, "actions", {}) : item]

  // Client
  clients = [for item in lookup(local.configs, "clients", {}) : item]

  // Client Grant
  client_grants = [for item in lookup(local.configs, "client_grants", {}) : item]

  // Email
  emails = [for item in lookup(local.configs, "emails", []) : item]

  // Org
  orgs = [for item in lookup(local.configs, "orgs", []) : item]

  // Prompt
  prompts = [for item in lookup(local.configs, "prompts", []) : item]

  // DB
  db_connections = [for item in lookup(local.configs, "db_connections", []) : item]

  // Gooogle Connections
  google = [for item in lookup(local.configs, "google", []) : item]

}
