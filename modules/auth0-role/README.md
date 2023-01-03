### `Auth0 Role` usage
```
module "auth0_role" {
  source = "dasmeta/modules/auth0//modules/auth0-role"

  roles = [{
    name = "Administrator"
    description = "Administrator role"
  },{
    name = "Development"
    description = "Development role"
  }, {
    name = "Intermediary"
    description = "Intermediary role"
  }]
}

terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.34.0" # Refer to docs for latest version
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
| [auth0_role.roles](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_permissions"></a> [permissions](#input\_permissions) | Permission to configure, resource\_server\_identifier must be an | <pre>list(object({<br>    name                       = string<br>    resource_server_identifier = any<br>  }))</pre> | `[]` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | Roles to create | <pre>list(object({<br>    description = string<br>    name        = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roles"></a> [roles](#output\_roles) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
