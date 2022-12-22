output "client_credentials" {
  description = "Client credentials for each client created."
  sensitive   = true
  value = { for client in module.auth0_client : client.app_name => {
    client_id     = client.client_id
    client_secret = client.client_secret
    }
  }
}
