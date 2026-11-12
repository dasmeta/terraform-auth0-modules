# auth0_trigger_actions owns every binding of its trigger, so the module
# creates exactly one per trigger. Actions run in ascending trigger_order;
# actions without trigger_order run after the ordered ones. Ties and unset
# values are ordered by name.
locals {
  deployed_actions = { for name, action in local.actions : name => action if action.deploy }

  trigger_binding_sort_keys = {
    for name, action in local.deployed_actions : name => (
      action.trigger_order == null
      ? "1/${name}"
      : format("0/%09d/%s", action.trigger_order, name)
    )
  }
  trigger_binding_names = { for name, key in local.trigger_binding_sort_keys : key => name }

  trigger_bindings = {
    for trigger in distinct([for action in values(local.deployed_actions) : action.supported_triggers.id]) : trigger => [
      for key in sort([
        for name, action in local.deployed_actions : local.trigger_binding_sort_keys[name]
        if action.supported_triggers.id == trigger
      ]) : local.trigger_binding_names[key]
    ]
  }
}

resource "auth0_trigger_actions" "bindings" {
  for_each = local.trigger_bindings

  trigger = each.key

  dynamic "actions" {
    for_each = each.value
    content {
      id           = module.action[actions.value].id
      display_name = module.action[actions.value].display_name
    }
  }
}

# Up to v1.10.0 the module created one auth0_trigger_actions per action, keyed
# by action name. Those addresses cannot be moved to the per-trigger resource
# (moved blocks need static keys), and destroying them would send an empty
# binding list for the trigger, possibly after the new binding was written.
# Forget them instead: the new per-trigger resource replaces the remote binding
# list in a single call on create.
removed {
  from = auth0_trigger_actions.trigger_binding

  lifecycle {
    destroy = false
  }
}
