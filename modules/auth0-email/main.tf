# This is set up the email provider with Amazon SES
resource "auth0_email" "amazon_ses_email_provider" {
  name                 = "ses"
  enabled              = var.enable_ses_email_provider
  default_from_address = var.default_from_address

  credentials {
    access_key_id     = var.credentials.access_key_id
    secret_access_key = var.credentials.secret_access_key
    region            = var.credentials.region
  }
}

resource "auth0_email_template" "my_email_template" {
  count       = var.create_template ? 1 : 0
  depends_on = [auth0_email.amazon_ses_email_provider]

  template                = var.email_template
  body                    = var.body_template
  from                    = var.from
  result_url              = var.result_url
  subject                 = var.subject
  syntax                  = var.syntax
  url_lifetime_in_seconds = var.url_lifetime_in_seconds
  enabled                 = var.enbale_teplate
}
