resource "auth0_client" "my_client" {
  name = var.application_name
  # description                         = var.description
  app_type                            = var.app_type
  custom_login_page_on                = var.custom_login_page_on
  custom_login_page                   = var.custom_login_page
  is_first_party                      = var.is_first_party
  is_token_endpoint_ip_header_trusted = var.is_trusted_endpoint
  token_endpoint_auth_method          = var.token_endpoint_auth_method
  oidc_conformant                     = var.oidc_conformant
  callbacks                           = var.callbacks
  cross_origin_auth                   = var.cross_origin_auth
  allowed_origins                     = var.allowed_origins
  allowed_logout_urls                 = var.allowed_logout_urls
  web_origins                         = var.web_origins
  organization_require_behavior       = var.organization_require_behavior
  organization_usage                  = var.organization_usage
  grant_types                         = var.grant_types
  client_metadata                     = var.client_metadata

  jwt_configuration {
    lifetime_in_seconds = var.jwt_configuration.lifetime_in_seconds
    secret_encoded      = var.jwt_configuration.secret_encoded
    alg                 = var.jwt_configuration.alg
  }

  refresh_token {
    leeway                       = var.refresh_token.leeway
    token_lifetime               = var.refresh_token.token_lifetime
    rotation_type                = var.refresh_token.rotation_type
    expiration_type              = var.refresh_token.expiration_type
    idle_token_lifetime          = var.refresh_token.idle_token_lifetime
    infinite_idle_token_lifetime = var.refresh_token.infinite_idle_token_lifetime
    infinite_token_lifetime      = var.refresh_token.infinite_token_lifetime
  }

  sso          = var.sso
  sso_disabled = var.sso_disabled
  logo_uri     = var.logo_uri
}
