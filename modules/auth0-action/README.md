### `Auth0 Action`  

```
module "test" {
  source  = "../"
  code    = "/**\n* Handler that will be called during the execution of a PostChangePassword flow.\n*\n* @param {Event} event - Details about the user and the context in which the change password is happening.\n*/\nexports.onExecutePostChangePassword = async (event) => {\n};\n"
  name    = "test"
  runtime = "node16"

  supported_triggers = {
    id      = "post-change-password"
    version = "v2"
  }

  dependencies = {
    name    = ""
    version = ""
  }
}

terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "~>0.37.1" # Refer to docs for latest version
    }
  }
}

provider "auth0" {
  domain        = ""
  client_id     = ""
  client_secret = ""
}
```
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
| [auth0_action.my_action](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/action) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_code"></a> [code](#input\_code) | n/a | `string` | n/a | yes |
| <a name="input_dependencies"></a> [dependencies](#input\_dependencies) | n/a | <pre>list(object({<br>    name    = string<br>    version = string<br>  }))</pre> | `[]` | no |
| <a name="input_deploy"></a> [deploy](#input\_deploy) | n/a | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"Action"` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | n/a | `string` | `"node16"` | no |
| <a name="input_supported_triggers"></a> [supported\_triggers](#input\_supported\_triggers) | n/a | <pre>object({<br>    id      = string<br>    version = string<br>  })</pre> | <pre>{<br>  "id": "post-login",<br>  "version": "v3"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_supported_triggers_id"></a> [supported\_triggers\_id](#output\_supported\_triggers\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
