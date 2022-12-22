### `Auth0 Org` module minimal usage
```
module "auth0_org" {
  source = "dasmeta/modules/auth0//modules/auth0-org"
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
### `Auth0 Org` all parameters usage
```
module "auth0-org" {
  source = "dasmeta/modules/auth0//modules/auth0-org"

  name = "auth0-org"
  display_name = "Auth0 org"

  branding = [{
    logo_url = "https://example.com"
    colors = {
      primary = "#f2f2f2"
      page_background = "#e1e1e1"
    }
  }]

  connections = [{
    connection_id = module.auth0-auth-db.auth0-connection_id
  }]
}

module "auth0-auth-db" {
  source = "dasmeta/modules/auth0//modules/auth0-auth-db"
}

terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~> 0.34"
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
| [auth0_organization.my_organization](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/organization) | resource |
| [auth0_organization_connection.my_org_conn](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/organization_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branding"></a> [branding](#input\_branding) | Defines how to style the login pages. | <pre>list(object({<br>    logo_url = string<br>    colors = object({<br>      primary         = string<br>      page_background = string<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_connections"></a> [connections](#input\_connections) | Connections configuration for organization. | <pre>list(object({<br>    connection_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Friendly name of this organization. | `string` | `"Auth0 org"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of this organization. | `string` | `"auth0-org"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth-org-id"></a> [auth-org-id](#output\_auth-org-id) | n/a |
| <a name="output_auth-org-name"></a> [auth-org-name](#output\_auth-org-name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
