# Auth0 DB Signup Control Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Allow individual Auth0 database connections to disable self-service signup through `db_connections`.

**Architecture:** Add one optional boolean to the existing root connection object and forward it through the existing `auth0-auth-db` wrapper to the provider's `auth0_connection.options` block. The `false` default preserves the existing behavior; callers set `true` only for invite-only connections.

**Tech Stack:** Terraform 1.15.4, Auth0 provider `~> 1.50` (initialized at 1.58.0), terraform-docs, pre-commit.

---

### Task 1: Record required module-change evidence

**Files:**
- Create: `specs/001-auth0-db-disable-signup/spec.md`
- Create: `specs/001-auth0-db-disable-signup/plan.md`
- Create: `specs/001-auth0-db-disable-signup/tasks.md`

- [ ] **Step 1: Create the feature specification**

Write `specs/001-auth0-db-disable-signup/spec.md` with the user-visible requirement:

```markdown
# Auth0 database signup control

## Requirement

`db_connections` entries may set `disable_signup = true` to prevent Auth0 self-service registration for that database connection. Omitted values default to `false` and retain the existing behavior.
```

- [ ] **Step 2: Create the technical plan and task evidence**

Write `plan.md` and `tasks.md` in the same directory. Record that the affected module is `modules/auth0-auth-db`, the existing wrapper is preserved, the provider feature is **supported** by the v1.50 provider resource documentation, and the optional field is non-breaking with no material interface widening.

- [ ] **Step 3: Check the evidence package**

Run: `test -f specs/001-auth0-db-disable-signup/spec.md && test -f specs/001-auth0-db-disable-signup/plan.md && test -f specs/001-auth0-db-disable-signup/tasks.md`

Expected: exit code `0`.

- [ ] **Step 4: Commit the evidence package**

```bash
git add specs/001-auth0-db-disable-signup
git commit -m "docs: plan Auth0 DB signup control"
```

### Task 2: Add the optional wrapper input and provider mapping

**Files:**
- Create: `modules/auth0-auth-db/tests/disable_signup.tftest.hcl`
- Modify: `variables.tf` in the `db_connections` object type
- Modify: `auth0-auth-db.tf` in module `auth0-auth-db`
- Modify: `modules/auth0-auth-db/variables.tf`
- Modify: `modules/auth0-auth-db/main.tf`

- [ ] **Step 1: Write the mocked-provider behavior tests first**

Create `modules/auth0-auth-db/tests/disable_signup.tftest.hcl` with `mock_provider "auth0" {}` and two `command = plan` runs. Run the test from the child module with `terraform -chdir=modules/auth0-auth-db test`. It tests the child directly, so each run sets the child input (or omits it) and asserts the directly accessible resource value.

After adding the root module argument, run this repeatable static assertion:

```bash
rg -q '^[[:space:]]*disable_signup[[:space:]]*=[[:space:]]*each\.value\.disable_signup[[:space:]]*$' auth0-auth-db.tf
```

Expected: exit code `0`, confirming the wrapper passes the per-entry value to the child input. This assertion complements the child mocked-provider behavior test: together they verify the root maps each connection value to the child input and the child maps that input to resource options. Root `terraform validate`, after the root object attribute and child input are defined, checks configuration and type validity; it does not by itself prove the value mapping.

```hcl
mock_provider "auth0" {}

run "explicit_true_reaches_connection" {
  command = plan

  variables { disable_signup = true }

  assert {
    condition     = auth0_connection.my-database-connection.options[0].disable_signup == true
    error_message = "disable_signup=true must reach the Auth0 connection options."
  }
}

run "omitted_value_defaults_false" {
  command = plan

  assert {
    condition     = auth0_connection.my-database-connection.options[0].disable_signup == false
    error_message = "An omitted disable_signup value must resolve to false."
  }
}
```

- [ ] **Step 2: Run the tests before implementation**

Run: `terraform -chdir=modules/auth0-auth-db test`

Expected: the test suite fails before implementation because the child input and resource behavior are missing; do not expect only one case to fail.

- [ ] **Step 3: Establish the pre-change validation baseline**

Run: `terraform validate`

Expected: `Success! The configuration is valid.`

- [ ] **Step 4: Add the root optional attribute**

In `variables.tf`, add this field beside the other database connection options:

```hcl
disable_signup = optional(bool, false)
```

- [ ] **Step 5: Forward the root input to the child module**

In `auth0-auth-db.tf`, add this module argument:

```hcl
disable_signup = each.value.disable_signup
```

- [ ] **Step 6: Add the child variable and resource argument**

In `modules/auth0-auth-db/variables.tf`, add:

```hcl
variable "disable_signup" {
  description = "Indicates whether to disable self-service sign-ups for this database connection."
  type        = bool
  default     = false
}
```

In `modules/auth0-auth-db/main.tf`, replace the commented-out setting with:

```hcl
disable_signup = var.disable_signup
```

- [ ] **Step 7: Verify the root per-entry forwarding**

Run: `rg -q '^[[:space:]]*disable_signup[[:space:]]*=[[:space:]]*each\.value\.disable_signup[[:space:]]*$' auth0-auth-db.tf`

Expected: exit code `0`; the wrapper forwards each connection's value to the child input.

- [ ] **Step 8: Verify both child resource behavior cases**

Run: `terraform -chdir=modules/auth0-auth-db test`

Expected: both mocked-provider assertions pass.

- [ ] **Step 9: Verify the changed configuration**

Run: `terraform fmt -check -recursive && terraform validate`

Expected: both commands exit `0`; validation reports a valid configuration.

- [ ] **Step 10: Commit the Terraform change**

```bash
git add variables.tf auth0-auth-db.tf modules/auth0-auth-db/variables.tf modules/auth0-auth-db/main.tf modules/auth0-auth-db/tests/disable_signup.tftest.hcl
git commit -m "feat: support disabling Auth0 DB signups"
```

### Task 3: Regenerate interface documentation

**Files:**
- Modify: `README.md`
- Modify: `modules/auth0-auth-db/README.md`

- [ ] **Step 1: Regenerate documentation from live variables**

Run: `pre-commit run terraform_docs --all-files`

Expected: the root `db_connections` input shows `disable_signup = optional(bool, false)` and the child-module input table lists `disable_signup` with a `false` default.

- [ ] **Step 2: Verify the public interface is documented**

Run: `rg -n "disable_signup" README.md modules/auth0-auth-db/README.md`

Expected: matches in both files, with no manually added customer-specific names.

- [ ] **Step 3: Run the full repository verification**

Run: `terraform fmt -check -recursive && terraform validate && terraform -chdir=modules/auth0-auth-db test && rg -q '^[[:space:]]*disable_signup[[:space:]]*=[[:space:]]*each\.value\.disable_signup[[:space:]]*$' auth0-auth-db.tf && pre-commit run --all-files`

Expected: all commands exit `0`. The static assertion verifies the root per-entry mapping, and the child-module mocked test verifies that the child input reaches the Auth0 resource. `terraform validate` checks overall configuration and type validity but does not prove the value mapping by itself.

- [ ] **Step 4: Commit documentation and final verification**

```bash
git add README.md modules/auth0-auth-db/README.md
git commit -m "docs: document Auth0 DB signup control"
git status --short
```

Expected: no tracked changes remain; local `.terraform/` and lock-file artifacts remain untracked and are not added.

## Plan self-review

- **Spec coverage:** Tasks 2 and 3 implement and document every approved requirement; Task 1 supplies the required module-change evidence.
- **Compatibility:** The only new input is optional with a `false` default; no existing caller must change.
- **Scope:** Only the root wrapper, its database-connection child module, the direct child-module test at `modules/auth0-auth-db/tests/disable_signup.tftest.hcl`, documentation, and required evidence are touched. The test adds no root output to expose child internals.
- **Placeholders and consistency:** All planned paths, Terraform names, defaults, commands, and commit scopes are explicit and consistent.
