# Auth0 custom domains implementation plan

## Provider support and scope

The Auth0 Terraform provider's official [`auth0_custom_domain` resource
documentation](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/custom_domain)
documents the resource used to create custom domains. This repository pins the
provider to `~> 1.50` in `provider.tf`; the implementation will use
`auth0_custom_domain` within that provider constraint.

The plan excludes `auth0_custom_domain_verification`: DNS records are owned by
the caller's DNS configuration, and verification is a separate action after
those records are established. It also excludes `auth0_custom_domain_default`,
which handles Auth0's separate default-domain selection. The module will expose
origin and verification data for external DNS setup, but will not create DNS
records or run verification.

## Implementation approach

Add a focused child module that manages one `auth0_custom_domain`, then add a
root input defaulting to an empty list and instantiate the child once per
domain. Return the useful domain and DNS handoff values from the child and
aggregate them at the root. Cover defaults and outputs with mocked-provider
Terraform tests, document the public interface, then run formatting,
validation, test, and documentation checks.
