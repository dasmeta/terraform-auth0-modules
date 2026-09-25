# Auth0 custom domains implementation tasks

Each task should be completed and reviewed before moving to the next.

## 1. Add the child module

- [ ] Create `modules/auth0-custom-domain/` with resource configuration,
  variables, outputs, and provider version constraints.
- [ ] Require `domain`; default certificate `type` to
  `auth0_managed_certs` and define any supported optional settings.
- [ ] Expose the Auth0 domain ID, domain, origin domain name, status, and
  verification values needed by callers.

## 2. Add mocked-provider tests

- [ ] Create `modules/auth0-custom-domain/tests/custom_domain.tftest.hcl`.
- [ ] Assert the default certificate type and applicable default TLS policy.
- [ ] Assert explicitly supported certificate settings and that outputs map
  to the managed resource.
- [ ] Run `terraform -chdir=modules/auth0-custom-domain test`.

## 3. Wire the root interface

- [ ] Add a `custom_domains` root input with an empty-list default, required
  domain values, and certificate defaults.
- [ ] Create one child module instance per configured domain.
- [ ] Add a root output keyed by domain, including origin and verification
  values for DNS handoff.

## 4. Document the public interface

- [ ] Update the root README input and output documentation.
- [ ] Add `modules/auth0-custom-domain/README.md` describing its inputs,
  outputs, and external DNS/verification boundary.
- [ ] Run the repository's Terraform documentation generation/check workflow.

## 5. Validate the change

- [ ] Run `terraform fmt -check -recursive`.
- [ ] Run `terraform validate` for the root module and
  `terraform -chdir=modules/auth0-custom-domain validate` for the child.
- [ ] Run the child mocked-provider tests and relevant documentation checks.
- [ ] Confirm no DNS records, verification resource, or default-domain
  selection resource is added.
