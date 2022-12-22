### `Auth0 Auth DB` module minimal usage
This module is used to create new Database connection for Auth0
```
module "auth0-auth-db" {
  source = "dasmeta/modules/auth0//modules/auth0-auth-db"
  name = "Example-Connections"
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
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~> 0.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~> 0.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_connection.my-database-connection](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_brute_force_protection"></a> [brute\_force\_protection](#input\_brute\_force\_protection) | Indicates whether to enable brute force protection, which will limit the number of signups and failed logins from a suspicious IP address. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the connection | `string` | `"Example-Connection"` | no |
| <a name="input_password_dictionary"></a> [password\_dictionary](#input\_password\_dictionary) | Configuration settings for the password dictionary check. | <pre>object({<br>    enable     = bool<br>    dictionary = list(string)<br>  })</pre> | <pre>{<br>  "dictionary": [],<br>  "enable": true<br>}</pre> | no |
| <a name="input_password_history"></a> [password\_history](#input\_password\_history) | Configuration settings for the password history that is maintained for each user to prevent the reuse of passwords. | <pre>object({<br>    enable = bool<br>    size   = number<br>  })</pre> | <pre>{<br>  "enable": true,<br>  "size": 3<br>}</pre> | no |
| <a name="input_password_no_personal_info"></a> [password\_no\_personal\_info](#input\_password\_no\_personal\_info) | Configuration settings for the password personal info check. | `bool` | `true` | no |
| <a name="input_password_policy"></a> [password\_policy](#input\_password\_policy) | Indicates level of password strength to enforce during authentication. | `string` | `"good"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth0-connection_id"></a> [auth0-connection\_id](#output\_auth0-connection\_id) | n/a |
| <a name="output_auth0-google-oauth-name"></a> [auth0-google-oauth-name](#output\_auth0-google-oauth-name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
