# auth0-email

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
| [auth0_email.this](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/email) | resource |
| [auth0_email_template.this](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/email_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials"></a> [credentials](#input\_credentials) | Configuration settings for the credentials for the email provider. | <pre>object({<br>    access_key_id     = string<br>    secret_access_key = string<br>    region            = string<br>    api_key           = string<br>  })</pre> | n/a | yes |
| <a name="input_default_from_address"></a> [default\_from\_address](#input\_default\_from\_address) | Default from address for emails | `string` | n/a | yes |
| <a name="input_enable_provider"></a> [enable\_provider](#input\_enable\_provider) | n/a | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the email provider. Options include mailgun, mandrill, sendgrid, ses, smtp, and sparkpost. | `string` | `null` | no |
| <a name="input_templates"></a> [templates](#input\_templates) | Configuration for email templates. | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
