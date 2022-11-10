resource "auth0_connection" "my-database-connection" {
  name     = var.name
  strategy = "auth0"
  # is_domain_connection = var.is_domain_connection
  # enabled_clients = var.enabled_clients
  options {
    password_policy        = var.password_policy
    brute_force_protection = var.brute_force_protection

    password_history {
      enable = var.password_history.enable
      size   = var.password_history.size
    }

    password_no_personal_info {
      enable = var.password_no_personal_info
    }

    password_dictionary {
      enable     = var.password_dictionary.enable
      dictionary = var.password_dictionary.dictionary
    }

    #   allowed_audiences              = []
    #   api_enable_users               = false
    #   auth_params                    = {}
    #   custom_scripts                 = {}
    #   debug                          = false
    #   disable_cache                  = false
    #   disable_sign_out               = false
    #   domain_aliases                 = []
    #   forward_request_info           = false
    #   ips                            = []
    #   non_persistent_attrs           = []
    #   pkce_enabled                   = false
    #   scopes                         = []
    #   scripts                        = {}
    #   sign_saml_request              = false
    #   strategy_version               = 0
    #   use_cert_auth                  = false
    #   use_kerberos                   = false
    #   use_wsfed                      = false
    #   waad_common_endpoint           = false
    #   enabled_database_customization = var.enabled_database_customization
    #   import_mode                    = var.import_mode
    #   requires_username              = var.requires_username
    #   disable_signup                 = var.disable_signup

    #   password_complexity_options {
    #     min_length = var.password_complexity_options
    #   }

    #   validation {
    #     username {
    #       min = var.validation.username.min
    #       max = var.validation.username.max
    #     }
    #   }

    #   mfa {
    #     active                 = var.mfa.active
    #     return_enroll_settings = var.mfa.return_enroll_settings
    #   }
  }
}
