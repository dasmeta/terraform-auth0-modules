module "auth0-email" {
  source   = "./modules/auth0-email"
  for_each = { for v in var.emails : v.name => v }

  # auth0_email resource
  name                 = each.value.name
  default_from_address = each.value.default_from_address
  credentials = {
    access_key_id     = lookup(each.value, "access_key_id", null)
    secret_access_key = lookup(each.value, "secret_access_key", null)
    region            = lookup(each.value, "region", null)
    api_key           = lookup(each.value, "api_key", null)
  }

  # auth0_email_template resource
  templates = lookup(each.value, "templates", {})
}
