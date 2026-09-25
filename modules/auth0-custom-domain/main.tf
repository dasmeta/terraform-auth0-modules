resource "auth0_custom_domain" "this" {
  domain                   = var.domain
  type                     = var.type
  tls_policy               = var.type == "auth0_managed_certs" ? var.tls_policy : null
  domain_metadata          = var.domain_metadata
  relying_party_identifier = var.relying_party_identifier
}
