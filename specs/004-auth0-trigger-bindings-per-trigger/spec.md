# Auth0 action trigger bindings per trigger

## Problem

The root module created one `auth0_trigger_actions` per deployed action, keyed
by action name. The provider documents that `auth0_trigger_actions` manages
all action bindings of its trigger. With two deployed actions on the same
trigger, each resource overwrote the other's binding list on every apply and
one action ended up unbound. Callers also had no way to set the order in which
the actions of one trigger run.

## Requirements

- The module creates exactly one `auth0_trigger_actions` per trigger that has
  at least one action with `deploy = true`, keyed by the trigger id.
- Each `actions` entry accepts an optional `trigger_order` whole number from 0
  to 999999999. Bindings follow ascending `trigger_order`; actions without it
  follow the ordered ones; ties and unset values are ordered by name.
- Actions with `deploy = false` are created but not bound.
- No new required inputs. Existing configurations keep working unchanged.

## Upgrade

- Existing per-action binding resources are forgotten with a `removed` block
  (`destroy = false`), not destroyed. The provider's delete sends an empty
  binding list for the trigger, and without a dependency between the old and
  new resources that delete could run after the new binding was written.
- The new per-trigger resource replaces the trigger's binding list with one API
  call on create, so actions stay bound during the apply.
- `moved` blocks are not possible: their addresses must be static, and the old
  keys are caller-defined action names.

## Acceptance criteria

- Two deployed actions on one trigger produce one binding resource whose
  actions follow `trigger_order`, also when that order differs from name order.
- Mixed set and unset `trigger_order` values follow the documented order.
- `deploy = false` actions are absent from the bindings, and a trigger with
  only undeployed actions gets no binding resource.
- A single action on another trigger still gets its own binding resource.
- A state produced by the per-action layout upgrades to the per-trigger layout
  without destroying any binding.
