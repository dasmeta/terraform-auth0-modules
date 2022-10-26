# terraform-auth0-modules
### This module  allow you to create and manage clients, resource servers(api), client grants, connections, email providers and  rules and  roles, tenants as part of a Terraform deployment.

## Example
[Auth0 multi resources create] (https://github.com/dasmeta/terraform-auth0-modules/tree/main/examples)

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_action"></a> [action](#module\_action) | ./modules/auth0-action | n/a |
| <a name="module_auth0-auth-db"></a> [auth0-auth-db](#module\_auth0-auth-db) | ./modules/auth0-auth-db | n/a |
| <a name="module_auth0-goa"></a> [auth0-goa](#module\_auth0-goa) | ./modules/auth0-auth-google | n/a |
| <a name="module_auth0-org"></a> [auth0-org](#module\_auth0-org) | ./modules/auth0-org | n/a |
| <a name="module_auth0-tenant"></a> [auth0-tenant](#module\_auth0-tenant) | ./modules/auth0-tenant | n/a |
| <a name="module_auth0_api"></a> [auth0\_api](#module\_auth0\_api) | ./modules/auth0-api | n/a |
| <a name="module_auth0_client"></a> [auth0\_client](#module\_auth0\_client) | ./modules/auth0-client | n/a |
| <a name="module_auth0_role"></a> [auth0\_role](#module\_auth0\_role) | ./modules/auth0-role | n/a |
| <a name="module_email"></a> [email](#module\_email) | ./modules/auth0-email | n/a |

## Resources

| Name | Type |
|------|------|
| [auth0_client_grant.my_client_grant](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/client_grant) | resource |
| [auth0_prompt.my_prompt](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/prompt) | resource |
| [auth0_trigger_binding.trigger_binding](https://registry.terraform.io/providers/auth0/auth0/latest/docs/resources/trigger_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_actions"></a> [actions](#input\_actions) | Actions are secure, tenant-specific, versioned functions written in Node.js that execute at certain points during the Auth0 runtime. Actions are used to customize and extend Auth0's capabilities with custom logic. | `any` | `[]` | no |
| <a name="input_apis"></a> [apis](#input\_apis) | With this resource, you can set up APIs that can be consumed from your authorized applications. | `any` | `[]` | no |
| <a name="input_client-id"></a> [client-id](#input\_client-id) | Auth0 client id | `string` | n/a | yes |
| <a name="input_client-secret"></a> [client-secret](#input\_client-secret) | Auth0 client secret | `string` | n/a | yes |
| <a name="input_client_grants"></a> [client\_grants](#input\_client\_grants) | Auth0 uses various grant types, or methods by which you grant limited access to your resources to another entity without exposing credentials. | `any` | `[]` | no |
| <a name="input_clients"></a> [clients](#input\_clients) | With this resource, you can set up applications that use Auth0 for authentication and configure allowed callback URLs and secrets for these applications. | `any` | `[]` | no |
| <a name="input_db_connections"></a> [db\_connections](#input\_db\_connections) | With Auth0, you can define sources of users, otherwise known as connections, which may include identity providers database authentication methods. | `any` | `[]` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Auth0 domain | `string` | n/a | yes |
| <a name="input_emails"></a> [emails](#input\_emails) | With Auth0, you can have standard welcome, password reset, and account verification email-based workflows built right into Auth0. | `any` | `[]` | no |
| <a name="input_google"></a> [google](#input\_google) | With Auth0, you can define sources of users, otherwise known as connections, which may include identity provider Google  authentication methods. | `any` | `[]` | no |
| <a name="input_orgs"></a> [orgs](#input\_orgs) | The Organizations feature represents a broad update to the Auth0 platform that allows our business-to-business (B2B) customers to better manage their partners and customer | `any` | `[]` | no |
| <a name="input_prompts"></a> [prompts](#input\_prompts) | With this resource, you can manage your Auth0 prompts, including choosing the login experience version. | `any` | `[]` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | With this resource, you can create and manage collections of permissions that can be assigned to users, which are otherwise known as roles. | `list(any)` | <pre>[<br>  {<br>    "description": "Administrator role",<br>    "name": "Administrator",<br>    "permissions": []<br>  }<br>]</pre> | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | With this resource, you can manage Auth0 tenants | `list(any)` | <pre>[<br>  {<br>    "change_password": {<br>      "enabled": "true",<br>      "html": ""<br>    },<br>    "default_redirection_uri": "",<br>    "friendly_name": "",<br>    "guardian_mfa_page": {<br>      "enabled": "true",<br>      "html": ""<br>    }<br>  }<br>]</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
