# Tasks: Auth0 database connection signup control

1. Add `disable_signup` as an optional boolean with a default of `false` to the
   root `db_connections` input.
2. Forward `disable_signup` for each connection from the root wrapper to the
   child module.
3. Define the child module's `disable_signup` input as a boolean defaulting to
   `false`.
4. Set the Auth0 database connection's `options.disable_signup` from the child
   module input.
5. Regenerate the affected generated README documentation.
6. Run `terraform fmt -check -recursive`, `terraform validate`, and
   `pre-commit run --all-files`.
