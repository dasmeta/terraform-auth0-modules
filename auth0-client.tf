locals {
  client_defaults = {
    allowed_logout_urls           = []
    allowed_origins               = []
    callbacks                     = []
    web_origins                   = []
    organization_usage            = null
    organization_require_behavior = null
    cross_origin_auth             = "false"
    custom_login_page_on          = "true"
    token_endpoint_auth_method    = "none"
    grant_types                   = ["client_credentials"]
    token_endpoint_auth_method    = "client_secret_post"
    jwt_configuration = {
      alg                 = "RS256"
      lifetime_in_seconds = "36000"
      secret_encoded      = "false"
    }
    refresh_token = {
      expiration_type              = "non-expiring"
      idle_token_lifetime          = "2592000"
      infinite_idle_token_lifetime = "true"
      infinite_token_lifetime      = "true"
      leeway                       = "0"
      rotation_type                = "non-rotating"
      token_lifetime               = "31557600"
    }
  }
}
module "auth0_client" {
  source   = "./modules/auth0-client"
  for_each = { for v in var.clients : v.name => v }

  application_name = each.value.name

  app_type                      = each.value.app_type
  cross_origin_auth             = lookup(each.value, "cross_origin_auth", local.client_defaults.cross_origin_auth)
  custom_login_page_on          = lookup(each.value, "custom_login_page_on", local.client_defaults.custom_login_page_on)
  grant_types                   = lookup(each.value, "grant_types", local.client_defaults.grant_types)
  token_endpoint_auth_method    = lookup(each.value, "token_endpoint_auth_method", local.client_defaults.token_endpoint_auth_method)
  allowed_logout_urls           = lookup(each.value, "allowed_logout_urls", local.client_defaults.allowed_logout_urls)
  allowed_origins               = lookup(each.value, "allowed_origins", local.client_defaults.allowed_origins)
  callbacks                     = lookup(each.value, "callbacks", local.client_defaults.callbacks)
  web_origins                   = lookup(each.value, "web_origins", local.client_defaults.web_origins)
  organization_usage            = lookup(each.value, "organization_usage", local.client_defaults.organization_usage)
  jwt_configuration             = lookup(each.value, "jwt_configuration", local.client_defaults.jwt_configuration)
  refresh_token                 = lookup(each.value, "refresh_token", local.client_defaults.refresh_token)
  organization_require_behavior = lookup(each.value, "organization_require_behavior", local.client_defaults.organization_require_behavior)
}
