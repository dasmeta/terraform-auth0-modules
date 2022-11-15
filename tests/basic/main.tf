locals {
  friendly_name = "dasmeta-dev"
  # default_redirection_uri = "https://marketplace.dasmeta.de"
  sandbox_version = "16"
  # default_directory       = "Username-Password-Authentication"

  support_email = "support@dasmeta.com"
  support_url   = "https://www.dasmeta.com/"

  # change_password = [{
  #   enabled = true
  #   html    = file("${path.module}/htmls/${var.env}/change_password.liquid")
  # }]

  # error_page = [{
  #   html          = file("${path.module}/htmls/${var.env}/error_page.liquid")
  #   show_log_link = false
  #   url           = "https://frontend-dev.int.dasmeta.app/auth-error"
  # }]

  # orgs = {
  #   "company-a" = {
  #     name         = "company-a"
  #     display_name = "Company A"
  #     #   connections = [{
  #     #     connection_id = "con_BNVX4EQzbtlwvXG7"
  #     #     }
  #     #   ]
  #   },
  #   "company-b" = {
  #     name         = "company-b"
  #     display_name = "Company B"
  #   }
  # }

  # clients = {
  #   "Corify Marketplace" = {
  #     allowed_logout_urls  = ["http://127.0.0.1:5173", "http://localhost:5173", "https://frontend-dev.int.dasmeta.app"]
  #     allowed_origins      = ["http://127.0.0.1:5173", "http://localhost:5173", "https://frontend-dev.int.dasmeta.app"]
  #     web_origins          = ["http://127.0.0.1:5173", "http://localhost:5173", "https://frontend-dev.int.dasmeta.app"]
  #     callbacks            = ["http://127.0.0.1:5173", "http://localhost:5173", "https://frontend-dev.int.dasmeta.app", "https://frontend-dev.int.dasmeta.app/auth-error"]
  #     custom_login_page    = file("${path.module}/htmls/${var.env}/custom_login_page.liquid")
  #     custom_login_page_on = true
  #   }
  #   "Corify Marketplace (Test Application)" = {
  #     callbacks = ["https://dasmetadev.eu12.webtask.io/auth0-authentication-api-debugger"]
  #   }
  # }

  # emails = {
  #   "contact@dasmeta.app" = {
  #     body_template = file("${path.module}/email-templates/change_password.liquid")
  #     result_url    = "https://frontend-dev.int.dasmeta.app/"
  #   },
  # }

  # client_grants = {
  #   "Corify Marketplace (Test Application) dasmeta" = {
  #     audience    = "https://dasmetadev.eu.auth0.com/api/v2/"
  #     client_name = "Corify Marketplace (Test Application)"
  #     scope       = ["read:client_grants", "create:client_grants", "delete:client_grants", "update:client_grants", "read:users", "update:users", "delete:users", "create:users", "read:users_app_metadata", "update:users_app_metadata", "delete:users_app_metadata", "create:users_app_metadata", "read:user_custom_blocks", "create:user_custom_blocks", "delete:user_custom_blocks", "create:user_tickets", "read:clients", "update:clients", "delete:clients", "create:clients", "read:client_keys", "update:client_keys", "delete:client_keys", "create:client_keys", "read:connections", "update:connections", "delete:connections", "create:connections", "read:resource_servers", "update:resource_servers", "delete:resource_servers", "create:resource_servers", "read:device_credentials", "update:device_credentials", "delete:device_credentials", "create:device_credentials", "read:rules", "update:rules", "delete:rules", "create:rules", "read:rules_configs", "update:rules_configs", "delete:rules_configs", "read:hooks", "update:hooks", "delete:hooks", "create:hooks", "read:actions", "update:actions", "delete:actions", "create:actions", "read:email_provider", "update:email_provider", "delete:email_provider", "create:email_provider", "blacklist:tokens", "read:stats", "read:insights", "read:tenant_settings", "update:tenant_settings", "read:logs", "read:logs_users", "read:shields", "create:shields", "update:shields", "delete:shields", "read:anomaly_blocks", "delete:anomaly_blocks", "update:triggers", "read:triggers", "read:grants", "delete:grants", "read:guardian_factors", "update:guardian_factors", "read:guardian_enrollments", "delete:guardian_enrollments", "create:guardian_enrollment_tickets", "read:user_idp_tokens", "create:passwords_checking_job", "delete:passwords_checking_job", "read:custom_domains", "delete:custom_domains", "create:custom_domains", "update:custom_domains", "read:email_templates", "create:email_templates", "update:email_templates", "read:mfa_policies", "update:mfa_policies", "read:roles", "create:roles", "delete:roles", "update:roles", "read:prompts", "update:prompts", "read:branding", "update:branding", "delete:branding", "read:log_streams", "create:log_streams", "delete:log_streams", "update:log_streams", "create:signing_keys", "read:signing_keys", "update:signing_keys", "read:limits", "update:limits", "create:role_members", "read:role_members", "delete:role_members", "read:entitlements", "read:attack_protection", "update:attack_protection", "read:organizations_summary", "create:actions_log_sessions", "read:organizations", "update:organizations", "create:organizations", "delete:organizations", "create:organization_members", "read:organization_members", "delete:organization_members", "create:organization_connections", "read:organization_connections", "update:organization_connections", "delete:organization_connections", "create:organization_member_roles", "read:organization_member_roles", "delete:organization_member_roles", "create:organization_invitations", "read:organization_invitations", "delete:organization_invitations"]
  #   },
  # }
}

module "auth0-basic-test" {
  source = "../.."

  sandbox_version = local.sandbox_version
  friendly_name   = local.friendly_name
  support_url     = local.support_url
  support_email   = local.support_email
}
