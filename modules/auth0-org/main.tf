resource "auth0_organization" "my_organization" {
  name         = var.name
  display_name = var.display_name

  dynamic "branding" {
    for_each = var.branding
    content {
      logo_url = var.branding[0].logo_url
      colors = {
        primary         = var.branding[0].colors.primary
        page_background = var.branding[0].colors.page_background
      }
    }
  }

  # dynamic "connections" {
  #   for_each = var.connections
  #   content {
  #     connection_id = connections.value.connection_id
  #   }
  # }
}

resource "auth0_organization_connection" "my_org_conn" {
  for_each = toset(var.connections)

  organization_id = auth0_organization.my_organization.id
  connection_id   = each.value.connection_id
  # assign_membership_on_login = true
}
