output "custom_domain_id" {
  description = "Auth0 identifier of the custom domain."
  value       = auth0_custom_domain.this.id
}

output "domain" {
  description = "Configured custom domain hostname."
  value       = auth0_custom_domain.this.domain
}

output "origin_domain_name" {
  description = "Auth0 origin hostname for DNS configuration."
  value       = auth0_custom_domain.this.origin_domain_name
}

output "status" {
  description = "Current status of the custom domain."
  value       = auth0_custom_domain.this.status
}

output "verification" {
  description = "Verification data needed to configure external DNS."
  value       = auth0_custom_domain.this.verification
}
