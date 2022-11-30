resource "auth0_resource_server" "rs" {
  name        = var.name
  identifier  = var.identifier
  signing_alg = var.signing_alg

  token_lifetime                                  = var.token_lifetime
  token_lifetime_for_web                          = var.token_lifetime_for_web
  skip_consent_for_verifiable_first_party_clients = var.skip_consent_for_verifiable_first_party_clients
  enforce_policies                                = var.enforce_policies
  token_dialect                                   = var.token_dialect

  dynamic "scopes" {
    for_each = var.scopes
    content {
      value       = scopes.value["value"]
      description = scopes.value["description"]
    }
  }
}
