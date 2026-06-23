terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.50"
    }
  }

  required_version = ">= 1.15.0"
}

provider "auth0" {
  domain        = var.domain
  client_id     = var.client-id
  client_secret = var.client-secret
}
