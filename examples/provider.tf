terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.50"
    }
  }
  # cloud {
  #   organization = "terraform-org-name"
  #   workspaces {
  #     tags = ["component:auth0"]
  #   }
  # }
}

provider "auth0" {
  domain        = "*********"
  client_id     = "*********"
  client_secret = "*********"
}
