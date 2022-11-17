
resource "auth0_user" "user" {
  for_each = { for user in var.users : user.email => user }

  connection_name = var.connection_name
  name            = each.value.name
  email           = each.value.email
  roles           = each.value.roles
  password        = each.value.password
  email_verified  = true
}
