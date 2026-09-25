module "auth0-auth-db" {
  source   = "./modules/auth0-auth-db"
  for_each = { for v in var.db_connections : v.name => v }

  name                           = each.value.name
  custom_scripts                 = each.value.custom_scripts
  password_policy                = each.value.password_policy
  password_history               = each.value.password_history
  password_no_personal_info      = each.value.password_no_personal_info
  password_dictionary            = each.value.password_dictionary
  brute_force_protection         = each.value.brute_force_protection
  disable_signup                 = each.value.disable_signup
  enabled_database_customization = each.value.enabled_database_customization
  custom_scripts_configuration   = each.value.custom_scripts_configuration
}
