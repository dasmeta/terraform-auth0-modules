# Auth0 database connection signup control

## Requirement

Each entry in `db_connections` may set `disable_signup = true` to prevent
self-service registration through that Auth0 database connection.

If `disable_signup` is omitted, it defaults to `false`, preserving the current
behavior.
