locals {
  auth0_db_connections = [
    {
      enabled_clients = [
        "**************",
        "**************",
      ]
      is_domain_connection = false
      name                 = "Username-Password-Authentication"
      metadata             = {}
      realms               = ["Username-Password-Authentication"]
    }
  ]
}
