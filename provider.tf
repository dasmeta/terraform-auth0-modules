terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.40.0" # Refer to docs for latest version
    }
  }

  required_version = "~> 1.3.0"
}

provider "auth0" {
  domain        = var.domain
  client_id     = var.client-id
  client_secret = var.client-secret
}
