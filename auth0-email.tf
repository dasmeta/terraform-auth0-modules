module "auth0-email" {
  source   = "./modules/auth0-email"
  for_each = { for v in var.emails : v.name => v }

  name = each.value.name
  default_from_address = each.value.default_from_address
  credentials = {
    access_key_id     = lookup(each.value, "access_key_id", null)
    secret_access_key = lookup(each.value, "secret_access_key", null)
    region            = lookup(each.value, "region", null)
    api_key           = lookup(each.value, "api_key", null)
  }
  create_template = lookup(each.value,"create_template",false)
  email_template = lookup(each.value,"email_template","")
  body_template = lookup(each.value,"body_template","")
  from = lookup(each.value,"from","")
  result_url = lookup(each.value,"result_url","")
  subject = lookup(each.value,"subject","")
  syntax = lookup(each.value,"syntax","liquid")
  url_lifetime_in_seconds = lookup(each.value,"url_lifetime_in_seconds",604800)
  enable_template = lookup(each.value,"enable_template",true)
}
