# Auth0 database connection signup control

## Goal

Allow each managed Auth0 database connection to explicitly disable self-service
sign-up while preserving the current behavior for every existing configuration.

## Design

Add an optional `disable_signup` boolean to each item in the root
`db_connections` input, with a default of `false`. Forward this value to the
`auth0-auth-db` child module. The child module will declare the same variable
and set `options.disable_signup` on its `auth0_connection` resource.

`false` continues to permit Auth0 self-registration. A connection that only
accepts invited users can opt in with `disable_signup = true`.

## Scope

- Update the root `db_connections` object type and module argument.
- Update the child module variable and `auth0_connection.options` block.
- Update generated or hand-maintained documentation to show the option.
- Validate formatting and configuration syntax without changing remote Auth0
  resources.

## Compatibility and risks

The new field is optional and defaults to `false`, so existing callers do not
change behavior. Setting it to `true` changes the selected connection's Auth0
login behavior by disabling self-registration; invitation and administrator
provisioning remain available.

## Verification

Run `terraform fmt -check -recursive` and `terraform validate` after the
change. Confirm the generated plan/schema accepts the new optional field when
the locally installed provider can be loaded.
