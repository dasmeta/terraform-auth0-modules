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
- `modules/auth0-auth-db/tests/disable_signup.tftest.hcl` for mocked-provider
  behavior tests against the child module directly.
- Generated README files for the affected module documentation.

## Validation

- `terraform fmt -check -recursive`
- `terraform validate`
- `terraform -chdir=modules/auth0-auth-db test`
- `rg -q '^[[:space:]]*disable_signup[[:space:]]*=[[:space:]]*each\.value\.disable_signup[[:space:]]*$' auth0-auth-db.tf`
- `pre-commit run --all-files`

Run the native test from the child module with
`terraform -chdir=modules/auth0-auth-db test`. It must mock the Auth0 provider
and verify that an explicit child input `disable_signup = true` reaches the
resource's `options.disable_signup`, and that omitting the child input resolves
to `false` at the resource. The test addresses the child resource directly; it
does not assume root module expressions expose child resources. The child
mocked-provider test verifies child-input-to-resource behavior. The
root `rg -q` assertion verifies the per-entry root-to-child mapping. Together
these checks prove the root value is forwarded and the child maps it to
`options.disable_signup`. Root `terraform validate`, after defining the root
object attribute and child variable, checks configuration and type validity;
it does not by itself prove that value mapping.
