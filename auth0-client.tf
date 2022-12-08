module "auth0_client" {
  source   = "./modules/auth0-client"
  for_each = { for v in var.clients : v.name => v }

  application_name = each.value.name

  app_type                      = each.value.app_type
  cross_origin_auth             = each.value.cross_origin_auth
  custom_login_page_on          = each.value.custom_login_page_on
  custom_login_page             = each.value.custom_login_page
  grant_types                   = each.value.grant_types
  token_endpoint_auth_method    = each.value.token_endpoint_auth_method
  allowed_logout_urls           = each.value.allowed_logout_urls
  allowed_origins               = each.value.allowed_origins
  callbacks                     = each.value.callbacks
  web_origins                   = each.value.web_origins
  organization_usage            = each.value.organization_usage
  jwt_configuration             = each.value.jwt_configuration
  logo_uri                      = each.value.logo_uri
  refresh_token                 = each.value.refresh_token
  sso                           = each.value.sso
  organization_require_behavior = each.value.organization_require_behavior
}
