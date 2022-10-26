# auth0-email

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_auth0"></a> [auth0](#requirement\_auth0) | ~>0.37.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_auth0"></a> [auth0](#provider\_auth0) | ~>0.37.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [auth0_email.amazon_ses_email_provider](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/email) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials"></a> [credentials](#input\_credentials) | Configuration settings for the credentials for the email provider. | <pre>object({<br>    access_key_id     = string<br>    secret_access_key = string<br>    region            = string<br>  })</pre> | n/a | yes |
| <a name="input_default_from_address"></a> [default\_from\_address](#input\_default\_from\_address) | Default from address for emails | `string` | n/a | yes |
| <a name="input_enable_ses_email_provider"></a> [enable\_ses\_email\_provider](#input\_enable\_ses\_email\_provider) | n/a | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
