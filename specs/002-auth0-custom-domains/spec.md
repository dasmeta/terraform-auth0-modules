# Auth0 custom domains

## User need

Callers need to configure zero or more custom domains on their Auth0 tenant
through this Terraform module and use Auth0's returned DNS details in their
DNS configuration.

## Requirements

- The root module accepts zero or more custom-domain entries. With no entries,
  it creates no custom domains.
- Every entry requires a `domain` value.
- Each entry defaults its certificate `type` to `auth0_managed_certs`.
- The module exposes Auth0's domain origin and DNS verification values so
  callers can configure DNS and complete the domain setup externally.
- The module does not create DNS records or run custom-domain verification.
- Selecting Auth0's default custom domain is outside this feature's scope.

## Acceptance criteria

- An empty configuration has no custom-domain instances.
- A domain can be configured with only its required `domain` value and uses
  Auth0-managed certificates by default.
- Outputs expose the Auth0 origin and verification information for each
  configured domain.
- No DNS records or verification actions are managed by this module.
