mock_provider "auth0" {
  mock_resource "auth0_custom_domain" {
    defaults = {
      id                 = "cd_test"
      origin_domain_name = null
      status             = "pending_verification"
      verification = [{
        error_msg        = ""
        last_verified_at = ""
        methods          = [{ name = "cname", value = "verification.example.com" }]
        status           = "pending"
      }]
    }
  }
}

run "no_custom_domains_by_default" {
  command = apply

  variables {
    domain        = "example.auth0.com"
    client-id     = "test-client-id"
    client-secret = "test-client-secret"
    roles         = []
  }

  assert {
    condition     = output.custom_domains == {}
    error_message = "The default custom_domains input must produce an empty output map."
  }
}

run "two_custom_domains_keyed_by_hostname" {
  command = apply

  variables {
    domain        = "example.auth0.com"
    client-id     = "test-client-id"
    client-secret = "test-client-secret"
    roles         = []
    custom_domains = [
      { domain = "login.example.com" },
      { domain = "identity.example.com" },
    ]
  }

  assert {
    condition     = toset(keys(output.custom_domains)) == toset(["login.example.com", "identity.example.com"])
    error_message = "The output must have one entry for each configured domain, keyed by hostname."
  }

  assert {
    condition     = output.custom_domains["login.example.com"].status == "pending_verification"
    error_message = "The root output must expose Auth0's domain status."
  }

  assert {
    condition     = output.custom_domains["login.example.com"].origin_domain_name == null
    error_message = "The Auth0 origin hostname is unavailable before the domain is ready."
  }

  assert {
    condition     = output.custom_domains["identity.example.com"].verification[0].methods[0].value == "verification.example.com"
    error_message = "The root output must expose verification methods for external DNS setup."
  }
}
