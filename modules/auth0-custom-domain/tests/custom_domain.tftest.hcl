mock_provider "auth0" {
  mock_resource "auth0_custom_domain" {
    defaults = {
      id                 = "cd_test"
      origin_domain_name = "origin.example.com"
      status             = "ready"
      tls_policy         = null
      verification = [{
        error_msg        = ""
        last_verified_at = ""
        methods          = [{ name = "cname", value = "verification.example.com" }]
        status           = "verified"
      }]
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

  assert {
    condition     = output.custom_domain_id == auth0_custom_domain.this.id && output.custom_domain_id == "cd_test"
    error_message = "The domain ID output must map to the managed Auth0 resource."
  }

  assert {
    condition     = output.domain == auth0_custom_domain.this.domain && output.domain == "identity.example.com"
    error_message = "The domain output must map to the managed Auth0 resource."
  }

  assert {
    condition     = output.origin_domain_name == auth0_custom_domain.this.origin_domain_name && output.origin_domain_name == "origin.example.com"
    error_message = "The origin output must map to the managed Auth0 resource."
  }

  assert {
    condition     = output.status == auth0_custom_domain.this.status && output.status == "ready"
    error_message = "The status output must map to the managed Auth0 resource."
  }

  assert {
    condition     = output.verification == auth0_custom_domain.this.verification && output.verification[0].methods[0].value == "verification.example.com"
    error_message = "The verification output must map to the managed Auth0 resource."
  }
}
