# Auth0 database profile attribute synchronization

## Goal

Expose Auth0's database-connection profile-attribute synchronization setting
through both the reusable database module and the repository root wrapper.

## Design

Add an optional `set_user_root_attributes` string input to
`modules/auth0-auth-db`, defaulting to `"on_each_login"`. Forward it to
`auth0_connection.options.set_user_root_attributes`.

Add the same optional attribute, with the same default, to each entry in the
root `db_connections` object and forward it to the child module. This retains
the established root-wrapper interface, rather than making the capability
available only to consumers of the child module.

The field controls whether Auth0 synchronizes `name`, `given_name`,
`family_name`, `nickname`, and `picture` from the external database on each
login, only on first login, or never on login. Supported provider values are
`on_each_login`, `on_first_login`, and `never_on_login`.

## Compatibility

This is an additive, backward-compatible interface change. Omitting the new
field retains the provider's current `on_each_login` behavior. No existing
resource address or required input changes.

## Verification

Native Terraform tests will prove that an explicit `never_on_login` value and
the omitted-value default reach the child resource. Root-level forwarding will
be checked as an independent expression assertion. Documentation generated
from the updated inputs will be refreshed, followed by Terraform formatting,
validation, module tests, and pre-commit checks.
