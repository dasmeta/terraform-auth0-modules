### `Auth0 Api`  usage

```
module "auth0_api" {
  source = "dasmeta/modules/auth0//modules/auth0-api"

  name = "My Resource Server"
  identifier = "my-resource-server-identifier"
  signing_alg = "RS256"
  token_dialect = ""

  token_lifetime = 86400
  skip_consent_for_verifiable_first_party_clients = true
  enforce_policies = true

  scopes = {
    value = "read:something"
    description = "read something"
  }
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
| [auth0_resource_server.rs](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/resource_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enforce_policies"></a> [enforce\_policies](#input\_enforce\_policies) | Indicates whether authorization polices are enforced. | `bool` | `true` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Unique identifier for the resource server. | `string` | `"my-resource-server-identifier"` | no |
| <a name="input_name"></a> [name](#input\_name) | Friendly name for the resource server. | `string` | `"My Resource Server (Managed by Terraform)"` | no |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | List of permissions (scopes) used by this resource server. | <pre>list(object({<br>    value       = string<br>    description = string<br>  }))</pre> | <pre>[<br>  {<br>    "description": "read something",<br>    "value": "read:something"<br>  }<br>]</pre> | no |
| <a name="input_signing_alg"></a> [signing\_alg](#input\_signing\_alg) | Algorithm used to sign JWTs. | `string` | `"RS256"` | no |
| <a name="input_skip_consent_for_verifiable_first_party_clients"></a> [skip\_consent\_for\_verifiable\_first\_party\_clients](#input\_skip\_consent\_for\_verifiable\_first\_party\_clients) | Indicates whether to skip user consent for applications flagged as first party. | `bool` | `true` | no |
| <a name="input_token_dialect"></a> [token\_dialect](#input\_token\_dialect) | Dialect of access tokens that should be issued for this resource server. Options include access\_token or access\_token\_authz (includes permissions). | `string` | `null` | no |
| <a name="input_token_lifetime"></a> [token\_lifetime](#input\_token\_lifetime) | Number of seconds during which access tokens issued for this resource server from the token endpoint remain valid. | `number` | `86400` | no |
| <a name="input_token_lifetime_for_web"></a> [token\_lifetime\_for\_web](#input\_token\_lifetime\_for\_web) | Number of seconds during which access tokens issued for this resource server via implicit or hybrid flows remain valid. Cannot be greater than the token\_lifetime value. | `number` | `7200` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_auth0-api-identifier"></a> [auth0-api-identifier](#output\_auth0-api-identifier) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
