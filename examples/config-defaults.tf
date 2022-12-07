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

    emails = {
      "test@dasmeta.com" = {
        name                 = "ses"
        default_from_address = "contact@dasmeta.com"
        access_key_id        = "********"
        secret_access_key    = "********"
        region               = "eu-central-1"
        email_template = {
          "support@dasmeta.com" = {
            from                      = "support@dasmeta.com"
            enabled                   = true
            template                  = "reset_email"
            url_lifetime_in_seconds   = 604800
            subject                   = "Welcome to DasMeta "
            syntax                    = "liquid"
            include_email_in_redirect = false
          }
        }
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

    mfa = {
      "mfa" = {
        policy = "all-applications"

        // Email
        // Users will receive an email message containing a verification code.
        email = false

        // One time password
        // Provide a one-time password using Google Authenticator or similar.
        otp = false

        // Provide a unique code that allows users to regain access to their account.
        recovery_code = false

        // Webauthn_roaming 
        webauthn_roaming = [{
          user_verification = "required"
        }]

        // Phone
        // Users will receive a phone message with a verification code
        phone = [{
          provider             = "auth0"
          message_types        = ["sms"]
          enrollment_message   = " Please enter this code to verify your enrollment."
          verification_message = "Verification code"
        }]

        // Push 
        // Provide a push notification using Auth0 Guardian.
        push = [{
          aws_region                        = "eu-central-1"
          aws_access_key_id                 = "access_key_id"
          aws_secret_access_key             = "secret_access_key "
          sns_apns_platform_application_arn = "arn"
          sns_gcm_platform_application_arn  = "arn"
          app_name                          = "custom_app_name"
          apple_app_link                    = null //null //"apple_app_link"
          google_app_link                   = null //"google_app_link"
        }]

        // Duo account for Multi-factor Authentication.
        duo = [{
          integration_key = "integration_key"
          secret_key      = "secret_key"
          hostname        = "hostname"
        }]
      }
    }
  }
}
