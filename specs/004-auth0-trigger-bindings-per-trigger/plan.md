# Implementation plan: Auth0 action trigger bindings per trigger

## Current state

`auth0-trigger-binding.tf` declares `auth0_trigger_actions.trigger_binding`
with `for_each` over deployed actions keyed by name. The provider resource's ID
is the trigger id; create and update call `UpdateBindings(trigger, actions)`,
delete calls `UpdateBindings(trigger, [])`.

## Design

- Add `trigger_order = optional(number)` to the root `actions` object type,
  with a validation for whole numbers from 0 to 999999999.
- Build a sort key per deployed action: `0/<zero-padded order>/<name>` when the
  order is set, `1/<name>` when it is not. Sorting these strings gives the
  documented order without changing behaviour for callers that set no order.
- Group deployed actions by `supported_triggers.id` and declare
  `auth0_trigger_actions.bindings` with `for_each` over the triggers and a
  dynamic `actions` block in sorted order.
- Add `removed { from = auth0_trigger_actions.trigger_binding }` with
  `lifecycle { destroy = false }`. A `removed` block cannot target instance
  keys, so the new resource needs a new name.

## Alternatives considered

- `moved` blocks: require static keys; the module cannot know callers' action
  names. Even for single-action triggers the module cannot write them.
- Destroy and create: the old instances' delete clears the trigger's bindings
  and has no ordering edge to the new create, so the trigger can end up with
  no bindings after a successful apply.
- `create_before_destroy`: only orders a replacement of the same address; it
  does not order the delete of a different resource.
- `auth0_trigger_action` (singular): appends to the end of the flow and cannot
  set the order.

## Planned files

- `variables.tf`: `trigger_order` attribute, description and validation.
- `auth0-trigger-binding.tf`: per-trigger resource and `removed` block.
- `tests/trigger_bindings.tftest.hcl`: mocked-provider tests.
- `tests/fixtures/legacy_trigger_binding/main.tf`: per-action layout for the
  upgrade test.
- `examples/config-defaults.tf`, `examples/actions-code/*.js`: two ordered
  post-login actions.
- `README.md`: binding behaviour, upgrade notes and generated input docs.

## Validation

`terraform fmt -check -recursive`, `terraform init -backend=false` and
`terraform validate` on the root and `examples/`, `terraform test` on the
root, and a `terraform plan -refresh=false` against a state in the v1.10.0
layout to record the upgrade plan output.
