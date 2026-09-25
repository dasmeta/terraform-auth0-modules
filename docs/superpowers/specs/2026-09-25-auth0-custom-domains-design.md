# Auth0 custom domains

## Goal

Allow callers of the root module to create Auth0 custom domains with
Auth0-managed certificates, without managing external DNS records.

## Design

Add a `custom_domains` root input containing zero or more domain objects. Each
object requires `domain` and defaults its certificate provisioning `type` to
`auth0_managed_certs` and its `tls_policy` to `recommended`.

The root module will create one focused `auth0-custom-domain` child module for
each entry. That child module will manage `auth0_custom_domain` and expose the
domain ID, Auth0 origin domain name, status, and verification methods for
callers or DNS automation to consume. Initial external DNS configuration uses
`verification[*].methods`; `origin_domain_name` becomes available after the
custom domain reaches `ready` status.

## Boundaries

- Auth0 custom-domain creation is in scope.
- Auth0-managed certificates are the supported default.
- DNS record creation is out of scope because this repository has no DNS
  provider integration.
- Calling `auth0_custom_domain_verification` is out of scope; it must follow
  DNS record creation in the owning DNS configuration.
- Managing Auth0's singleton default custom domain is out of scope.

## Compatibility and risks

`custom_domains` defaults to an empty list, so existing callers create no new
resources. A custom domain remains pending until the required Auth0 DNS record
is created externally using `verification[*].methods`. Once the domain is
`ready`, `origin_domain_name` is available for traffic routing.

## Verification

Add mocked-provider Terraform tests for the default certificate/TLS settings
and explicit supported settings. Run Terraform formatting, validation, tests,
and generated-documentation checks without applying against an Auth0 tenant.
