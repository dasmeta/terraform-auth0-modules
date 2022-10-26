locals {
  auth0_tenant = [
    {
      friendly_name           = "dev"
      default_redirection_uri = "https://*********"
      #   idle_session_lifetime   = "0"
      #   session_lifetime        = "0"

      change_password = [{
        enabled = "true"
        html    = ""
      }]
      guardian_mfa_page = [{
        enabled = "true"
        html    = ""
      }]
    }
  ]
}
