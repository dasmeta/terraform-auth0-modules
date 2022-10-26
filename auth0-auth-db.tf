module "auth0-auth-db" {
  source   = "./modules/auth0-auth-db"
  for_each = { for v in var.db_connections : v.name => v }

  name = each.value.name
}
