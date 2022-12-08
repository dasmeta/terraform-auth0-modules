module "auth0_role" {
  source   = "./modules/auth0-role"
  for_each = { for v in var.roles : v.name => v }

  roles = [{
    name        = each.value.name
    description = each.value.description
  }]

  permissions = each.value.permissions
}
