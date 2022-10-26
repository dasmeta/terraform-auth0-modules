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
