terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.40.0"
    }
  }
}

provider "auth0" {
  # domain = "das-meta"
  # client_id     = "<client-id>"
  # client_secret = "<client-secret>"
  # debug         = "<debug>"
}
