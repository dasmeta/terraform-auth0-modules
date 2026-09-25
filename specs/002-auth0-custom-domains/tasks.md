# Auth0 custom domains implementation tasks

Each task should be completed and reviewed before moving to the next.

## 1. Add the child module

- [x] Create `modules/auth0-custom-domain/` with resource configuration,
  variables, outputs, and provider version constraints.
- [x] Require `domain`; default certificate `type` to
  `auth0_managed_certs` and define any supported optional settings.
- [x] Expose the Auth0 domain ID, domain, origin domain name, status, and
  verification values needed by callers.

## 2. Add mocked-provider tests

- [x] Create `modules/auth0-custom-domain/tests/custom_domain.tftest.hcl`.
- [x] Assert the default certificate type and applicable default TLS policy.
- [x] Assert explicitly supported certificate settings and that outputs map
  to the managed resource.
- [x] Run `terraform -chdir=modules/auth0-custom-domain test`.

## 3. Wire the root interface

- [x] Add a `custom_domains` root input with an empty-list default, required
  domain values, and certificate defaults.
- [x] Create one child module instance per configured domain.
- [x] Add a root output keyed by domain, including origin and verification
  values for DNS handoff.
- [x] Add a root mock-provider test for the empty default and two domain-keyed
  output entries; run `terraform test` at the repository root.

## 4. Document the public interface

- [x] Update the root README input and output documentation.
- [x] Add `modules/auth0-custom-domain/README.md` describing its inputs,
  outputs, and external DNS/verification boundary.
- [x] Clarify in the child README and approved design that initial DNS uses
  `verification[*].methods` and `origin_domain_name` is available after `ready`.
- [x] Run the repository's Terraform documentation generation/check workflow.
  The hook changed generated table ordering and provider text using local
  untracked lockfiles; those unrelated changes were left out of this handoff.

## 5. Validate the change

- [x] Run `terraform fmt -check -recursive`.
- [x] Run `terraform validate` for the root module and
  `terraform -chdir=modules/auth0-custom-domain validate` for the child.
- [x] Run the root and child mocked-provider tests.
- [x] Confirm no DNS records, verification resource, or default-domain
  selection resource is added.
