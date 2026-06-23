# auth0-user

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~> 1.50 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~> 1.50 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_user.user](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/user) | resource |
| [auth0_user_roles.user_roles](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/user_roles) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_connection_name"></a> [connection\_name](#input\_connection\_name) | n/a | `string` | `"Username-Password-Authentication"` | no |
| <a name="input_users"></a> [users](#input\_users) | n/a | <pre>list(object({<br/>    name     = string<br/>    email    = string<br/>    roles    = list(string)<br/>    password = string<br/>  }))</pre> | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
