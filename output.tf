output "client_credentials" {
  description = "Client credentials for each client created."
  sensitive   = true
  value = { for client in module.auth0_client : client.app_name => {
    client_id     = client.client_id
    client_secret = client.client_secret
    }
  }
}

output "custom_domains" {
  description = "Auth0 custom domains keyed by domain, with values for external DNS configuration and verification."
  value = { for domain, custom_domain in module.auth0_custom_domain : domain => {
    id                 = custom_domain.custom_domain_id
    origin_domain_name = custom_domain.origin_domain_name
    status             = custom_domain.status
    verification       = custom_domain.verification
  } }
}
