locals {
  auth0_client = [
    {
      name     = "Frontend Application"
      app_type = "non_interactive"

    },
    {
      name        = "Marketplace Test"
      app_type    = "spa"
      grant_types = ["authorization_code", "implicit", "refresh_token"]

      allowed_logout_urls           = ["http://127.0.0.1:5173", "https://******"]
      allowed_origins               = ["http://127.0.0.1:5173", "https://******"]
      callbacks                     = ["http://127.0.0.1:5173", "https://******"]
      web_origins                   = ["http://127.0.0.1:5173", "https://******"]
      organization_usage            = "allow"
      organization_require_behavior = "no_prompt"
      token_endpoint_auth_method    = "none"
      refresh_token = {
        expiration_type              = "expiring"
        idle_token_lifetime          = "1296000"
        infinite_idle_token_lifetime = "false"
        infinite_token_lifetime      = "false"
        leeway                       = "0"
        rotation_type                = "rotating"
        token_lifetime               = "2592000"
      }
    },
  ]
}
