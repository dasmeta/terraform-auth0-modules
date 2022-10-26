module "email" {
  source   = "./modules/auth0-email"
  for_each = { for k, v in var.emails : k => v }

  default_from_address = each.value.default_from_address
  credentials = {
    access_key_id     = each.value.access_key_id
    secret_access_key = each.value.secret_access_key
    region            = each.value.region
  }
}
