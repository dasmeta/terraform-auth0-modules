locals {
  enabled_clients = [for clients in var.google : flatten([for client in clients.enabled_clients : [module.auth0_client[client].client_id]])]
}

module "auth0-goa" {
  source   = "./modules/auth0-auth-google"
  for_each = { for k, v in var.google : k => v }

  name            = each.value.name
  enabled_clients = each.value.enabled_clients // local.enabled_clients[each.key]
}
