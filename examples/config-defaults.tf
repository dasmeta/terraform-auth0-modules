locals {
  _defaults = {
    actions = {
      "test" = {
        code   = file("${path.module}/actions-code/test.js")
        name   = "test"
        deploy = false
      }
    }
    roles = {
      "Intermediary Role" = {
        description = "Intermediary Role"
        name        = "Intermediary"
        permissions = []
      },
      "Administrator role" = {
        description = "Administrator role"
        name        = "Administrator"
        permissions = []
      },
    }
    emails = {
      "test@dasmeta.com" = {
        default_from_address = "contact@dasmeta.com"
        access_key_id        = "********"
        secret_access_key    = "********"
        region               = "eu-central-1"
      },
    }

    clients = {
      "Frontend (Test)" = {
        name     = "Frontend (Test)"
        app_type = "non_interactive"
      },
      "test" = {
        name                          = "test"
        app_type                      = "spa"
        grant_types                   = ["authorization_code", "implicit", "refresh_token"]
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
    }
    apis = {
      "test" = {
        name             = "test"
        enforce_policies = "true"
        token_dialect    = "access_token_authz"
        identifier       = "https://test"

        scopes = [{
          description = "Permission for  admin users"
          value       = "admin"
        }]
      }
    }
    client_grants = {
      "test" = {
        audience    = "https://test"
        client_name = "test"
      }
    }

    orgs = []
  }
}
