# auth0-guardian

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
| [auth0_guardian.my_guardian](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/guardian) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_duo"></a> [duo](#input\_duo) | [{hostname = '', integration\_key = '', secret\_key = '' }] | `any` | `{}` | no |
| <a name="input_email"></a> [email](#input\_email) | n/a | `bool` | `false` | no |
| <a name="input_otp"></a> [otp](#input\_otp) | Indicates whether one time password MFA is enabled. | `bool` | `false` | no |
| <a name="input_phone"></a> [phone](#input\_phone) | [{ message\_types = 'sms', provider = 'auth0', enrollment\_message = '', verification\_message = ''}] | `list(any)` | `[]` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Policy to use. Available options are never, all-applications and confidence-score. | `string` | `"all-applications"` | no |
| <a name="input_push"></a> [push](#input\_push) | [{aws\_access\_key\_id = ''',aws\_region = '',aws\_secret\_access\_key  = '',sns\_apns\_platform\_application\_arn = '', sns\_gcm\_platform\_application\_arn = ''', app\_name = '', apple\_app\_link = '', google\_app\_link = ''}] | `list(any)` | `[]` | no |
| <a name="input_recovery_code"></a> [recovery\_code](#input\_recovery\_code) | Indicates whether recovery code MFA is enabled. | `bool` | `false` | no |
| <a name="input_webauthn_roaming"></a> [webauthn\_roaming](#input\_webauthn\_roaming) | Webauthn Roaming | `list(any)` | `[]` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
