resource "auth0_role" "roles" {
  for_each = { for role in var.roles : role.name => role.description }

  name        = each.key
  description = each.value

  dynamic "permissions" {
    for_each = var.permissions
    content {
      name                       = var.permissions[0].name
      resource_server_identifier = var.permissions[0].resource_server_identifier
    }
  }
}
