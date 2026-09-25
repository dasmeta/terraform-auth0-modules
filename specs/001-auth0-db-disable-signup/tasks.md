# Tasks: Auth0 database connection signup control

1. Create `tests/auth0-db-disable-signup.tftest.hcl` with a mocked Auth0
   provider and two plan assertions: explicit `disable_signup = true` reaches
   `options.disable_signup` on the child resource, and omitting the field
   resolves to `false` there.
2. Run `terraform test` and confirm the explicit-true assertion fails before
   implementation while the omitted-value expectation documents the default.
3. Add `disable_signup` as an optional boolean with a default of `false` to the
   root `db_connections` input.
4. Forward `disable_signup` for each connection from the root wrapper to the
   child module.
5. Define the child module's `disable_signup` input as a boolean defaulting to
   `false`.
6. Set the Auth0 database connection's `options.disable_signup` from the child
   module input.
7. Run `terraform test` and confirm both mocked-provider assertions pass.
8. Regenerate the affected generated README documentation.
9. Run `terraform fmt -check -recursive`, `terraform validate`,
   `terraform test`, and `pre-commit run --all-files`.
