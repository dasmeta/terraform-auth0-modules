module "auth0-tenant" {
  source = "./modules/auth0-tenant"

  friendly_name           = var.friendly_name
  change_password         = var.change_password
  guardian_mfa_page       = var.guardian_mfa_page
  default_redirection_uri = var.default_redirection_uri
  sandbox_version         = var.sandbox_version
  error_page              = var.error_page
  default_directory       = var.default_directory
  support_email           = var.support_email
  support_url             = var.support_url
}
