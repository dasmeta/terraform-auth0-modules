# Tasks: Auth0 database profile attribute synchronization

1. Add a native child-module Terraform test that asserts an explicit
   `never_on_login` reaches `auth0_connection.options`.
2. Run the new test before implementation and verify it fails because the
   child variable and resource argument are absent.
3. Add the optional root `db_connections.set_user_root_attributes` attribute
   without a default and forward it to the child module.
4. Add the optional child `set_user_root_attributes` variable with a `null`
   default and map it to the resource `options` block.
5. Add a native child-module test that proves omission resolves to `null`,
   then run all child tests successfully.
6. Regenerate the root and child Terraform README documentation.
7. Run formatting, validation, the child tests, the root-forwarding assertion,
   and pre-commit; review the final diff for scope and compatibility.
