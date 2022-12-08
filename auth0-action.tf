module "action" {
  source   = "./modules/auth0-action"
  for_each = { for v in var.actions : v.name => v }

  name               = each.value.name
  runtime            = each.value.runtime
  code               = each.value.code
  supported_triggers = each.value.supported_triggers
  dependencies       = each.value.dependencies
  deploy             = each.value.deploy
}
