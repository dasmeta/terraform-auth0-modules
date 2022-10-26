resource "auth0_action" "my_action" {
  name    = var.name
  runtime = var.runtime
  code    = var.code
  deploy  = var.deploy

  supported_triggers {
    id      = var.supported_triggers.id
    version = var.supported_triggers.version
  }

  dynamic "dependencies" {
    for_each = var.dependencies
    content {
      name    = dependencies.value["name"]
      version = dependencies.value["version"]
    }
  }
}
