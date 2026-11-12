locals {
  _defaults = {
    db_connections = [
      {
        name                      = "Username-Password-Authentication"
        password_policy           = "excellent"
        password_history          = { enable = true, size = 3 }
        password_no_personal_info = true
        password_dictionary       = { enable = true, dictionary = [] }
        brute_force_protection    = true
        custom_scripts = {
          get_user        = file("${path.module}/custom-db/aws-postgress-kms/get_user.js")
          remove          = file("${path.module}/custom-db/aws-postgress-kms/delete_user.js")
          create          = file("${path.module}/custom-db/aws-postgress-kms/create.js")
          verify          = file("${path.module}/custom-db/aws-postgress-kms/verify.js")
          login           = file("${path.module}/custom-db/aws-postgress-kms/login.js")
          change_password = file("${path.module}/custom-db/aws-postgress-kms/change_password.js")
        }

        custom_scripts_configuration = {
          accessKeyId      = ""
          secretAccessKey  = ""
          region           = "eu-central-1"
          kmsKeyId         = ""
          connectionString = "postgres://username:password@db_connection_url:5432/db_name"
        }
        enabled_database_customization = true
      }
    ]

    actions = {
      "test" = {
        code   = file("${path.module}/actions-code/test.js")
        name   = "test"
        deploy = false
        secrets = [
          {
            name  = "foo"
            value = "bar"
          }
        ]
        # client secrets fetches values from other managed client outputs
        # The `client` must be an existing managed client in this module
        client_secrets = [
          {
            name   = "CLIENT_ID"
            client = "Frontend (Test)"
            output = "client_id"
          }
        ]
      }
      # Deployed actions are bound to their trigger in ascending trigger_order.
      # Actions without trigger_order run after the ordered ones; ties sort by name.
      "Deny blocked users" = {
        code               = file("${path.module}/actions-code/deny-blocked-users.js")
        name               = "Deny blocked users"
        runtime            = "node22"
        supported_triggers = { id = "post-login", version = "v3" }
        deploy             = true
        trigger_order      = 1
      }
      "Add custom claims" = {
        code               = file("${path.module}/actions-code/add-custom-claims.js")
        name               = "Add custom claims"
        runtime            = "node22"
        supported_triggers = { id = "post-login", version = "v3" }
        deploy             = true
        trigger_order      = 2
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
            body                      = "Email template" //file("${path.module}/email-templates/change_password.liquid")
            result_url                = "https://frontend-dev.int.corify.app/"
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
