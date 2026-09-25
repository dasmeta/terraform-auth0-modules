# auth0-custom-domain

This module creates the custom domain in Auth0. DNS records and `auth0_custom_domain_verification` are managed externally; the module exposes the Auth0 origin hostname and verification values for use by DNS automation.

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
| [auth0_custom_domain.this](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/custom_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | Hostname to configure as an Auth0 custom domain. | `string` | n/a | yes |
| <a name="input_domain_metadata"></a> [domain\_metadata](#input\_domain\_metadata) | Metadata to associate with the custom domain. | `map(string)` | `{}` | no |
| <a name="input_relying_party_identifier"></a> [relying\_party\_identifier](#input\_relying\_party\_identifier) | Optional relying party identifier for the custom domain. | `string` | `null` | no |
| <a name="input_tls_policy"></a> [tls\_policy](#input\_tls\_policy) | TLS policy for Auth0-managed certificates. | `string` | `"recommended"` | no |
| <a name="input_type"></a> [type](#input\_type) | Certificate management type for the custom domain. | `string` | `"auth0_managed_certs"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_domain_id"></a> [custom\_domain\_id](#output\_custom\_domain\_id) | Auth0 identifier of the custom domain. |
| <a name="output_domain"></a> [domain](#output\_domain) | Configured custom domain hostname. |
| <a name="output_origin_domain_name"></a> [origin\_domain\_name](#output\_origin\_domain\_name) | Auth0 origin hostname for DNS configuration. |
| <a name="output_status"></a> [status](#output\_status) | Current status of the custom domain. |
| <a name="output_verification"></a> [verification](#output\_verification) | Verification data needed to configure external DNS. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
