locals {
  auth0_trigger_binding = [
    {
      trigger = "post-change-password"
      actions = {
        display_name = "User registration"
        id           = "826c69c65"
      }
    }
  ]
}
