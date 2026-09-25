module "auth0_custom_domain" {
  source   = "./modules/auth0-custom-domain"
  for_each = { for custom_domain in var.custom_domains : custom_domain.domain => custom_domain }

  domain                   = each.value.domain
  type                     = each.value.type
  tls_policy               = each.value.tls_policy
  domain_metadata          = each.value.domain_metadata
  relying_party_identifier = each.value.relying_party_identifier
}
