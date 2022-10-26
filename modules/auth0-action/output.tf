output "id" {
  value = auth0_action.my_action.id
}

output "display_name" {
  value = auth0_action.my_action.name
}

output "supported_triggers_id" {
  value = var.supported_triggers.id
}
