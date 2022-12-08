module "auth0-org" {
  source   = "./modules/auth0-org"
  for_each = { for i in var.orgs : i.name => i }

  name         = each.value.name
  display_name = each.value.display_name

  branding    = each.value.branding
  connections = each.value.connections
}
