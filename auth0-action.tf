locals {
  default_action = {
    runtime = "node16"
    supported_triggers = {
      id      = "post-change-password"
      version = "v2"
    }
    dependencies = []
  }
}

module "action" {
  source   = "./modules/auth0-action"
  for_each = { for v in var.actions : v.name => v }

  name               = each.value.name
  runtime            = lookup(each.value, "runtime", local.default_action.runtime)
  code               = each.value.code
  supported_triggers = lookup(each.value, "supported_triggers", local.default_action.supported_triggers)
  dependencies       = lookup(each.value, "dependencies", local.default_action.dependencies)
  deploy             = lookup(each.value, "deploy", false)
}
