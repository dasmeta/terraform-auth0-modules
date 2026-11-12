# Tasks: Auth0 action trigger bindings per trigger

1. Add native Terraform tests with a mocked provider for one binding per
   trigger, `trigger_order` that inverts name order, mixed set and unset
   orders, `deploy = false` exclusion, and a single action on another trigger.
2. Verify the tests fail against the per-action implementation.
3. Add the optional `trigger_order` attribute and its validation.
4. Replace the per-action binding with one binding per trigger in the
   documented order.
5. Add the `removed` block for the per-action addresses and a legacy fixture
   plus an upgrade test that shares state with it.
6. Record the upgrade plan output against a v1.10.0-layout state.
7. Update the example and the README, including the generated input docs.
8. Run formatting, validation, tests and pre-commit.
