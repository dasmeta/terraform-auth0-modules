# Tasks: Auth0 database connection signup control

1. Create `modules/auth0-auth-db/tests/disable_signup.tftest.hcl` with
   `mock_provider "auth0" {}` and two plan runs directly against the child
   module: explicit `disable_signup = true` reaches
   `auth0_connection.my-database-connection.options[0].disable_signup`, and
   omitting the input resolves to `false` there.
2. Run `terraform -chdir=modules/auth0-auth-db test` before implementation and
   confirm the tests fail because the child input/resource behavior is missing;
   do not expect only one case to fail.
3. Add `disable_signup` as an optional boolean with a default of `false` to the
   root `db_connections` input.
4. Forward `disable_signup` for each connection from the root wrapper to the
   child module.
5. After adding the forwarding argument, run
   `rg -q '^[[:space:]]*disable_signup[[:space:]]*=[[:space:]]*each\.value\.disable_signup[[:space:]]*$' auth0-auth-db.tf`;
   require exit code `0` as the root per-entry mapping assertion.
6. Define the child module's `disable_signup` input as a boolean defaulting to
   `false`.
7. Set the Auth0 database connection's `options.disable_signup` from the child
   module input.
8. Run `terraform -chdir=modules/auth0-auth-db test` and confirm both
   mocked-provider assertions pass.
9. Regenerate the affected generated README documentation.
10. Run `terraform fmt -check -recursive && terraform validate && terraform -chdir=modules/auth0-auth-db test && rg -q '^[[:space:]]*disable_signup[[:space:]]*=[[:space:]]*each\.value\.disable_signup[[:space:]]*$' auth0-auth-db.tf && pre-commit run --all-files`; require exit code `0`. The `rg -q` check verifies the root mapping; the child-module test verifies both resource behaviors. Root validation checks configuration and typing after both variables are defined, but does not by itself prove the value mapping.
