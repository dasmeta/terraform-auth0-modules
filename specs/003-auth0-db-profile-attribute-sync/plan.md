# Implementation plan: Auth0 database profile attribute synchronization

## Current state

`modules/auth0-auth-db` creates an `auth0_connection` with an `options` block,
but neither its input interface nor the root `db_connections` wrapper exposes
`set_user_root_attributes`. The prior `disable_signup` delivery establishes
the root-to-child forwarding pattern and native child-module tests.

## Design and compatibility

Add one optional string with default `"on_each_login"` at both interface
levels, then forward it unchanged. This preserves the narrow wrapper rather
than exposing a generic provider-options pass-through. It is additive and not
a material interface widening or a breaking change.

## Provider capability

The repository constrains the Auth0 provider to `~> 1.50`. Auth0's official
provider changelog records that v1.50 supports `never_on_login` for
`set_user_root_attributes`; the capability is classified as **supported**.
No provider or Terraform constraint change is needed.

## Planned files

- `variables.tf` — root grouped input attribute.
- `auth0-auth-db.tf` — root-to-child forwarding.
- `modules/auth0-auth-db/variables.tf` — child input.
- `modules/auth0-auth-db/main.tf` — provider option mapping.
- `modules/auth0-auth-db/tests/profile_attribute_sync.tftest.hcl` — native
  mocked-provider behavior tests.
- `README.md` and `modules/auth0-auth-db/README.md` — generated input docs.

## Validation

Initialize the root and child modules without a backend, then run Terraform
format checking, root validation, child native tests, a static root-forwarding
assertion, and pre-commit. The repository has existing untracked Terraform
working files; they remain outside the change.

## Governance

The repository has no `.specify/` bootstrap and the user declined adding it.
This package is the bounded documentation path; no shared-governance source or
repository automation changes are in scope.
