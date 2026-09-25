mock_provider "auth0" {
  mock_resource "auth0_custom_domain" {
    defaults = {
      tls_policy = null
    }
  }
}

run "managed_certificates_by_default" {
  command = plan

  variables {
    domain = "login.example.com"
  }

  assert {
    condition     = auth0_custom_domain.this.domain == "login.example.com"
    error_message = "The custom domain must use the requested hostname."
  }

  assert {
    condition     = auth0_custom_domain.this.type == "auth0_managed_certs"
    error_message = "Auth0-managed certificates must be the default."
  }

  assert {
    condition     = auth0_custom_domain.this.tls_policy == "recommended"
    error_message = "Managed certificates must use the recommended TLS policy by default."
  }
}

run "self_managed_certificates" {
  command = apply

  variables {
    domain = "identity.example.com"
    type   = "self_managed_certs"
  }

  assert {
    condition     = auth0_custom_domain.this.domain == "identity.example.com"
    error_message = "The self-managed custom domain must use the requested hostname."
  }

  assert {
    condition     = auth0_custom_domain.this.type == "self_managed_certs"
    error_message = "The certificate type must be self-managed."
  }

  assert {
    condition     = auth0_custom_domain.this.tls_policy == null
    error_message = "TLS policy must be omitted for self-managed certificates."
  }
}
