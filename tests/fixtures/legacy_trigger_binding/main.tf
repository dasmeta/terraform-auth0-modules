# Reproduces the trigger binding layout of v1.10.0 and earlier: one
# auth0_trigger_actions per deployed action, keyed by action name. The upgrade
# test applies this first and then runs the current module on the same state.
terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 1.50"
    }
  }
}

variable "actions" {
  type = list(object({
    name    = string
    code    = string
    runtime = optional(string, "node16")
    supported_triggers = optional(any, {
      id      = "post-change-password"
      version = "v2"
    })
    dependencies = optional(list(any), [])
    deploy       = optional(bool, false)
  }))
}

module "action" {
  source   = "../../../modules/auth0-action"
  for_each = { for v in var.actions : v.name => v }

  name               = each.value.name
  runtime            = each.value.runtime
  code               = each.value.code
  supported_triggers = each.value.supported_triggers
  dependencies       = each.value.dependencies
  deploy             = each.value.deploy
  secrets            = {}
}

resource "auth0_trigger_actions" "trigger_binding" {
  for_each = { for v in var.actions : v.name => v if v.deploy }
  actions {
    id           = module.action[each.key].id
    display_name = module.action[each.key].display_name
  }

  trigger = module.action[each.key].supported_triggers_id
}
