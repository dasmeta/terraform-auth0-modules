### `Auth0 Auth DB` module minimal usage
This module is used to create new Database connection for Auth0
```
module "auth0-auth-goa" {
  source = "dasmeta/modules/auth0//modules/auth0-auth-google"
  name = "Google-OAuth2-Connection"
  enabled_clients = []
}

terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.34.0"
    }
  }
}

provider "auth0" {
  domain        = "auth0-domain"
  client_id     = "client-id"
  client_secret = "client-secret"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~>0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~>0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_connection.google_oauth2](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_audiences"></a> [allowed\_audiences](#input\_allowed\_audiences) | List of allowed audiences. | `list(string)` | <pre>[<br>  "example.com",<br>  "api.example.com"<br>]</pre> | no |
| <a name="input_enabled_clients"></a> [enabled\_clients](#input\_enabled\_clients) | IDs of the clients for which the connection is enabled. | `list(string)` | `[]` | no |
| <a name="input_is_domain_connection"></a> [is\_domain\_connection](#input\_is\_domain\_connection) | n/a | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the connection. | `string` | `"Google-OAuth2-Connection"` | no |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | Permissions to grant to the connection. | `list(string)` | <pre>[<br>  "email",<br>  "profile",<br>  "gmail",<br>  "youtube"<br>]</pre> | no |
| <a name="input_set_user_root_attributes"></a> [set\_user\_root\_attributes](#input\_set\_user\_root\_attributes) | Determines whether the 'name', 'given\_name', 'family\_name', 'nickname', and 'picture' attributes can be independently updated when using an external IdP. | `string` | `"on_each_login"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth0-google-oauth-name"></a> [auth0-google-oauth-name](#output\_auth0-google-oauth-name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
