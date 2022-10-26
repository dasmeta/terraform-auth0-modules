resource "auth0_trigger_binding" "trigger_binding" {
  for_each = { for v in var.actions : v.name => v if lookup(v, "deploy", false) }
  actions {
    id           = module.action[each.key].id
    display_name = module.action[each.key].display_name
  }

  trigger = module.action[each.key].supported_triggers_id
}
