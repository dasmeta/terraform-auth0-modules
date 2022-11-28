resource "auth0_email" "this" {
  name                 = var.name
  enabled              = var.enable_provider
  default_from_address = var.default_from_address

  credentials {
    access_key_id     = var.credentials.access_key_id
    secret_access_key = var.credentials.secret_access_key
    region            = var.credentials.region
    api_key           = var.credentials.api_key
  }
}

resource "auth0_email_template" "this" {
  count       = var.create_template ? 1 : 0
  depends_on = [auth0_email.this]

  template                = var.email_template
  body                    = var.body_template
  from                    = var.from
  result_url              = var.result_url
  subject                 = var.subject
  syntax                  = var.syntax
  url_lifetime_in_seconds = var.url_lifetime_in_seconds
  enabled                 = var.enable_template
}
