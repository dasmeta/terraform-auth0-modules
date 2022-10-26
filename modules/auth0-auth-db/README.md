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
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~> 0.37.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~> 0.37.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_connection.my-database-connection](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the connection | `string` | `"Example-Connection"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth0-connection_id"></a> [auth0-connection\_id](#output\_auth0-connection\_id) | n/a |
| <a name="output_auth0-google-oauth-name"></a> [auth0-google-oauth-name](#output\_auth0-google-oauth-name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
