locals {
  default_org = {
    branding    = []
    connections = []
  }
}

module "auth0-org" {
  source   = "./modules/auth0-org"
  for_each = { for i in var.orgs : i.name => i }

  name         = each.value.name
  display_name = each.value.display_name

  branding    = lookup(each.value, "branding", local.default_org.branding)
  connections = lookup(each.value, "connections", local.default_org.connections)
}
