locals {
  default_api = {
    token_dialect = null
  }
}
module "auth0_api" {
  source   = "./modules/auth0-api"
  for_each = { for v in var.apis : v.name => v }

  name             = each.value.name
  scopes           = each.value.scopes
  identifier       = each.value.identifier
  enforce_policies = each.value.enforce_policies
  token_dialect    = lookup(each.value, "token_dialect", local.default_api.token_dialect)
}
