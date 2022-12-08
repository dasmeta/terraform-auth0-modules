module "auth0-email" {
  source   = "./modules/auth0-email"
  for_each = { for k, v in var.emails : k => v }

  # auth0_email resource
  name                 = each.value.name
  default_from_address = each.value.default_from_address
  credentials = {
    access_key_id     = each.value.access_key_id
    secret_access_key = each.value.secret_access_key
    region            = each.value.region
    api_key           = each.value.api_key
  }

  # auth0_email_template resource
  templates = each.value.email_template
}
