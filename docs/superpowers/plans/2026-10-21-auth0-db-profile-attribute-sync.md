# Auth0 database profile attribute synchronization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Allow root-wrapper and child-module consumers to configure when Auth0 synchronizes database-connection user root attributes.

**Architecture:** Preserve the existing root-wrapper-to-child-module flow used by `disable_signup`. A typed optional attribute in the root connection object passes unchanged to a typed child variable, which is emitted in `auth0_connection.options`; native tests exercise the child resource without Auth0 credentials.

**Tech Stack:** Terraform 1.15, Auth0 provider `~> 1.50`, Terraform native tests, terraform-docs, pre-commit.

---

## File structure

- `variables.tf` owns the root `db_connections` consumer interface.
- `auth0-auth-db.tf` owns root-to-child module argument forwarding.
- `modules/auth0-auth-db/variables.tf` owns the child input interface.
- `modules/auth0-auth-db/main.tf` owns the Auth0 connection resource mapping.
- `modules/auth0-auth-db/tests/profile_attribute_sync.tftest.hcl` owns mocked-provider behavior tests for the new capability.
- `README.md` and `modules/auth0-auth-db/README.md` are generated input documentation.

### Task 1: Specify the failing module behavior

**Files:**
- Create: `modules/auth0-auth-db/tests/profile_attribute_sync.tftest.hcl`

- [ ] **Step 1: Create the explicit-value test**

```hcl
mock_provider "auth0" {}

run "explicitly_never_sync_root_attributes" {
  command = plan

  variables {
    name                     = "profile-sync-disabled"
    set_user_root_attributes = "never_on_login"
  }

  assert {
    condition     = auth0_connection.my-database-connection.options[0].set_user_root_attributes == "never_on_login"
    error_message = "The database connection must not sync root attributes at login when requested."
  }
}
```

- [ ] **Step 2: Initialize the child module**

Run: `terraform -chdir=modules/auth0-auth-db init -backend=false`

Expected: Terraform reports successful provider initialization without creating managed Auth0 resources.

- [ ] **Step 3: Run the new test and verify RED**

Run: `terraform -chdir=modules/auth0-auth-db test -filter=tests/profile_attribute_sync.tftest.hcl`

Expected: FAIL because `set_user_root_attributes` is not yet declared or mapped by the child module.

### Task 2: Add the root-wrapper interface and forwarding

**Files:**
- Modify: `variables.tf` in the `db_connections` object definition
- Modify: `auth0-auth-db.tf` in module `auth0-auth-db`

- [ ] **Step 1: Add the typed optional root attribute**

Add the following field adjacent to `disable_signup` in the `db_connections` object:

```hcl
set_user_root_attributes = optional(string) # When set, controls root profile attribute synchronization; when omitted, preserves the provider value.
```

- [ ] **Step 2: Forward the per-connection value**

Add the following argument adjacent to `disable_signup` in `module "auth0-auth-db"`:

```hcl
set_user_root_attributes = each.value.set_user_root_attributes
```

- [ ] **Step 3: Verify the root mapping is present**

Run: `rg -q '^[[:space:]]*set_user_root_attributes[[:space:]]*=[[:space:]]*each\.value\.set_user_root_attributes[[:space:]]*$' auth0-auth-db.tf`

Expected: exit code `0`.

### Task 3: Add the child resource mapping and complete the test

**Files:**
- Modify: `modules/auth0-auth-db/variables.tf`
- Modify: `modules/auth0-auth-db/main.tf`
- Modify: `modules/auth0-auth-db/tests/profile_attribute_sync.tftest.hcl`

- [ ] **Step 1: Define the child variable**

Add this variable after `disable_signup`:

```hcl
variable "set_user_root_attributes" {
  description = "Determines whether Auth0 syncs name, given_name, family_name, nickname, and picture from the external database on login. Null preserves the provider value."
  type        = string
  default     = null
}
```

- [ ] **Step 2: Map the child input to the resource**

Add this argument in the resource `options` block adjacent to `disable_signup`:

```hcl
set_user_root_attributes = var.set_user_root_attributes
```

- [ ] **Step 3: Add the unmanaged-default test**

Append this run to `modules/auth0-auth-db/tests/profile_attribute_sync.tftest.hcl`:

```hcl
run "default_leaves_root_attributes_unmanaged" {
  command = plan

  assert {
    condition     = var.set_user_root_attributes == null
    error_message = "The database connection must leave root attribute synchronization unmanaged when the input is omitted."
  }
}
```

- [ ] **Step 4: Run the focused test and verify GREEN**

Run: `terraform -chdir=modules/auth0-auth-db test -filter=tests/profile_attribute_sync.tftest.hcl`

Expected: PASS with two runs passed.

### Task 4: Refresh generated documentation and run the complete verification

**Files:**
- Modify: `README.md`
- Modify: `modules/auth0-auth-db/README.md`

- [ ] **Step 1: Initialize the root module**

Run: `terraform init -backend=false`

Expected: Terraform installs local child module references and selects an Auth0 provider compatible with `~> 1.50`.

- [ ] **Step 2: Regenerate README documentation**

Run: `pre-commit run terraform_docs --files README.md modules/auth0-auth-db/README.md`

Expected: generated input tables contain `set_user_root_attributes` at the root and child levels, with no root default and a `null` child default.

- [ ] **Step 3: Run all validations**

Run: `terraform fmt -check -recursive && terraform validate && terraform -chdir=modules/auth0-auth-db test && rg -q '^[[:space:]]*set_user_root_attributes[[:space:]]*=[[:space:]]*each\.value\.set_user_root_attributes[[:space:]]*$' auth0-auth-db.tf && pre-commit run --all-files`

Expected: every command exits `0`; child tests report the existing sign-up cases and the two new profile-sync cases as passing.

- [ ] **Step 4: Review the final scope**

Run: `git diff --check && git diff -- variables.tf auth0-auth-db.tf modules/auth0-auth-db README.md`

Expected: no whitespace errors; only the additive input, forwarding, resource mapping, tests, and generated documentation appear.
