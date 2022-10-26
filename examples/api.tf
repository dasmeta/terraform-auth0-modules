

locals {
  auth0_api = [
    {
      name             = "Name"
      enforce_policies = "true"
      token_dialect    = "access_token_authz"
      identifier       = "https://***"

      scopes = [{
        description = "Permission for admin users"
        value       = "admin"
      }]
    }
  ]
}
