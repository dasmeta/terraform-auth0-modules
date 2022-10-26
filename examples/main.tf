module "auth0" {
  source = "../"

  auth0-domain        = ""
  auth0-client-id     = ""
  auth0-client-secret = ""

  // Role
  auth0_role = local.auth0_role

  // Tenant
  auth0_tenant = local.auth0_tenant

  // Api
  auth0_api = local.auth0_api

  // Action
  auth0_action = local.auth0_action

  // Client
  auth0_client = local.auth0_client

  // Client Grant
  auth0_client_grant = local.auth0_client_grant

  // Org
  auth0_org = local.auth0_org

  // Prompt
  auth0_prompt = local.auth0_prompt

  // Trigger Binding
  auth0_trigger_binding = local.auth0_trigger_binding

  // DB
  auth0_db_connections = local.auth0_db_connections

  // Gooogle Connections
  auth0_google = local.auth0_google

  // Email
  auth0_email = local.auth0_email
}


terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.37.1" # Refer to docs for latest version
    }
  }
}

provider "auth0" {
  domain        = "***********"
  client_id     = "***********"
  client_secret = "*************"
  debug         = true
}
