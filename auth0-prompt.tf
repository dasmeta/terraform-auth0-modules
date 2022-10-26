resource "auth0_prompt" "my_prompt" {
  for_each = { for k, v in var.prompts : k => v }

  identifier_first               = each.value.identifier_first
  universal_login_experience     = each.value.universal_login_experience
  webauthn_platform_first_factor = each.value.webauthn_platform_first_factor
}
