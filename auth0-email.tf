module "email" {
  source   = "./modules/auth0-email"
  for_each = { for k, v in var.emails : k => v }

  default_from_address = each.value.default_from_address
  credentials = {
    access_key_id     = each.value.access_key_id
    secret_access_key = each.value.secret_access_key
    region            = each.value.region
  }
  create_template = lookup(each.value,"create_template",false)
  email_template = lookup(each.value,"email_template","")
  body_template = lookup(each.value,"body_template","")
  from = lookup(each.value,"from","")
  result_url = lookup(each.value,"result_url","")
  subject = lookup(each.value,"subject","")
  syntax = lookup(each.value,"syntax","liquid")
  url_lifetime_in_seconds = lookup(each.value,"url_lifetime_in_seconds",3600)
  enbale_teplate = lookup(each.value,"enbale_teplate",true)
}
