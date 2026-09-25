# Implementation plan: Auth0 database signup control

## Scope and approach

- Affected module: `modules/auth0-auth-db`.
- Preserve the current root-wrapper pattern: accept connection configuration at
  the root and forward each connection to the child module.
- Provider capability classification: `supported`. The official Auth0 provider
  v1.50 `auth0_connection` resource documentation includes
  `options.disable_signup` in both its example and nested options schema, with
  no deprecation notice:
  [v1.50 resource documentation](https://raw.githubusercontent.com/auth0/terraform-provider-auth0/v1.50.0/docs/resources/connection.md).
  The repository's provider constraint is `~> 1.50`.
- This is not a breaking change. The interface widening is not material: it adds
  one optional field with a default value.

## Planned files

- `variables.tf`
- `auth0-auth-db.tf`
- `modules/auth0-auth-db/variables.tf`
- `modules/auth0-auth-db/main.tf`
- `tests/auth0-db-disable-signup.tftest.hcl` for mocked-provider behavior tests.
- Generated README files for the affected module documentation.

## Validation

- `terraform fmt -check -recursive`
- `terraform validate`
- `terraform test`
- `pre-commit run --all-files`

The native Terraform test must mock the Auth0 provider and verify that an
explicit `disable_signup = true` reaches the child resource's
`options.disable_signup`, and that an omitted `db_connections` field resolves
to `false` at the resource.
