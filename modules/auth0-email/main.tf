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
  depends_on = [auth0_email.this]

  for_each = var.templates

  template                  = each.value.template
  enabled                   = each.value.enabled
  body                      = each.value.body
  from                      = each.value.from
  subject                   = each.value.subject
  syntax                    = each.value.syntax
  include_email_in_redirect = each.value.include_email_in_redirect
  result_url                = each.value.result_url
  url_lifetime_in_seconds   = each.value.url_lifetime_in_seconds
}
