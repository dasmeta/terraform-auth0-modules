# Auth0 database profile attribute synchronization

## Scope

Extend `modules/auth0-auth-db` and the root `db_connections` wrapper so callers
can configure the Auth0 connection option `set_user_root_attributes`.

## Requirements

- The child module accepts an optional string input named
  `set_user_root_attributes`, defaulting to `"on_each_login"`.
- The child maps that input to `auth0_connection.options`.
- Each root `db_connections` entry accepts the same optional attribute with
  the same default and forwards it to the child module.
- Explicit `never_on_login` and the omitted default are verified with native
  Terraform tests against the child module.
- Generated root and child README input documentation reflects the new input.

## Compatibility

The interface is additive. Omitting the input preserves `on_each_login` and
does not change resource addresses or existing required inputs.

## Governance record

This repository is not Speckit-bootstrapped (`.specify/` is absent). The user
explicitly declined bootstrap on 2026-10-21. This numbered package follows the
repository's existing `specs/` convention as the bounded evidence record for
this module-impacting change.
