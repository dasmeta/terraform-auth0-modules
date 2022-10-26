locals {
  auth0_role = [
    {
      description = "Intermediary Role"
      name        = "Intermediary"
      permissions = []
    },
    {
      description = "Administrator role"
      name        = "Administrator"
      permissions = []
    },
    {
      description = "PDK"
      name        = " Admin"
      permissions = [{
        name                       = "admin"
        resource_server_identifier = "https://********"
      }]
    }
  ]
}
