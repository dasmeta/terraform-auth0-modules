module "auth0-auth-db" {
  source   = "./modules/auth0-auth-db"
  for_each = { for v in var.db_connections : v.name => v }

  name                      = each.value.name
  password_policy           = each.value.password_policy
  password_history          = each.value.password_history
  password_no_personal_info = each.value.password_no_personal_info
  password_dictionary       = each.value.password_dictionary
  brute_force_protection    = each.value.brute_force_protection
}
