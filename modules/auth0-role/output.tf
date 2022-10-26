output "roles" {
  value = [
    for role in auth0_role.roles : "Role name: ${role.name}, Role description: ${role.description}"
  ]
}
