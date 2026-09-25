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
5. Define the child module's `disable_signup` input as a boolean defaulting to
   `false`.
6. Set the Auth0 database connection's `options.disable_signup` from the child
   module input.
7. Run `terraform -chdir=modules/auth0-auth-db test` and confirm both
   mocked-provider assertions pass.
8. Regenerate the affected generated README documentation.
9. Run `terraform fmt -check -recursive`, root `terraform validate`,
   `terraform -chdir=modules/auth0-auth-db test`, and
   `pre-commit run --all-files`. The child-module test verifies the two
   resource behaviors directly; root validation checks the root object and
   child-module argument typing after both variables are defined.
