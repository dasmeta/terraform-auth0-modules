# Auth0 database profile attribute synchronization

## Goal

Expose Auth0's database-connection profile-attribute synchronization setting
through both the reusable database module and the repository root wrapper.

## Design

Add an optional `set_user_root_attributes` string input to
`modules/auth0-auth-db`, defaulting to `null`. Forward it to
`auth0_connection.options.set_user_root_attributes`; `null` leaves the
provider-computed value unmanaged.

Add the same optional attribute, without a default, to each entry in the root
`db_connections` object and forward it to the child module. This retains
the established root-wrapper interface, rather than making the capability
available only to consumers of the child module.

The field controls whether Auth0 synchronizes `name`, `given_name`,
`family_name`, `nickname`, and `picture` from the external database on each
login, only on first login, or never on login. Supported provider values are
`on_each_login`, `on_first_login`, and `never_on_login`.

## Compatibility

This is an additive, backward-compatible interface change. Omitting the new
field leaves the existing provider/API value unchanged; an explicit value opts
the connection into Terraform management. No existing resource address or
required input changes.

## Verification

Native Terraform tests will prove that an explicit `never_on_login` value
reaches the child resource and that an omitted input remains `null`. Root-level
forwarding will be checked as an independent expression assertion. Documentation
generated from the updated inputs will be refreshed, followed by Terraform
formatting, validation, module tests, and pre-commit checks.
