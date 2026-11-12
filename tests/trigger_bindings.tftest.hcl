mock_provider "auth0" {}

variables {
  domain        = "example.auth0.com"
  client-id     = "test-client-id"
  client-secret = "test-client-secret"
  roles         = []
}

run "one_binding_per_trigger_in_trigger_order" {
  command = apply

  variables {
    actions = [
      {
        name               = "Alpha"
        code               = "exports.onExecutePostLogin = async () => {};"
        runtime            = "node22"
        supported_triggers = { id = "post-login", version = "v3" }
        deploy             = true
        trigger_order      = 2
      },
      {
        name               = "Zeta"
        code               = "exports.onExecutePostLogin = async () => {};"
        runtime            = "node22"
        supported_triggers = { id = "post-login", version = "v3" }
        deploy             = true
        trigger_order      = 1
      },
      {
        name               = "Password changed"
        code               = "exports.onExecutePostChangePassword = async () => {};"
        runtime            = "node22"
        supported_triggers = { id = "post-change-password", version = "v2" }
        deploy             = true
      },
    ]
  }

  assert {
    condition     = toset(keys(auth0_trigger_actions.bindings)) == toset(["post-login", "post-change-password"])
    error_message = "There must be exactly one binding resource per trigger."
  }

  assert {
    condition     = auth0_trigger_actions.bindings["post-login"].trigger == "post-login"
    error_message = "The binding must target its trigger."
  }

  assert {
    condition     = [for a in auth0_trigger_actions.bindings["post-login"].actions : a.display_name] == ["Zeta", "Alpha"]
    error_message = "post-login actions must follow trigger_order, not name order."
  }

  assert {
    condition     = [for a in auth0_trigger_actions.bindings["post-login"].actions : a.id] == [module.action["Zeta"].id, module.action["Alpha"].id]
    error_message = "Bindings must reference the action IDs in trigger_order."
  }

  assert {
    condition     = [for a in auth0_trigger_actions.bindings["post-change-password"].actions : a.display_name] == ["Password changed"]
    error_message = "A single action on another trigger must still be bound."
  }
}

run "unset_order_runs_after_ordered_and_ties_sort_by_name" {
  command = plan

  variables {
    actions = [
      { name = "Delta", code = "x", supported_triggers = { id = "post-login", version = "v3" }, deploy = true },
      { name = "Bravo", code = "x", supported_triggers = { id = "post-login", version = "v3" }, deploy = true },
      { name = "Echo", code = "x", supported_triggers = { id = "post-login", version = "v3" }, deploy = true, trigger_order = 5 },
      { name = "Charlie", code = "x", supported_triggers = { id = "post-login", version = "v3" }, deploy = true, trigger_order = 5 },
      { name = "Foxtrot", code = "x", supported_triggers = { id = "post-login", version = "v3" }, deploy = true, trigger_order = 10 },
    ]
  }

  assert {
    condition     = [for a in auth0_trigger_actions.bindings["post-login"].actions : a.display_name] == ["Charlie", "Echo", "Foxtrot", "Bravo", "Delta"]
    error_message = "Order must be: trigger_order ascending (ties by name), then unordered actions by name."
  }
}

run "undeployed_actions_stay_unbound" {
  command = apply

  variables {
    actions = [
      {
        name               = "Live"
        code               = "x"
        supported_triggers = { id = "post-login", version = "v3" }
        deploy             = true
        trigger_order      = 2
      },
      {
        name               = "Draft"
        code               = "x"
        supported_triggers = { id = "post-login", version = "v3" }
        deploy             = false
        trigger_order      = 1
      },
      {
        name               = "Draft registration"
        code               = "x"
        supported_triggers = { id = "pre-user-registration", version = "v2" }
      },
    ]
  }

  assert {
    condition     = keys(auth0_trigger_actions.bindings) == ["post-login"]
    error_message = "A trigger with only undeployed actions must not get a binding resource."
  }

  assert {
    condition     = [for a in auth0_trigger_actions.bindings["post-login"].actions : a.display_name] == ["Live"]
    error_message = "Actions with deploy = false must not be bound."
  }

  assert {
    condition     = length(module.action) == 3
    error_message = "Undeployed actions must still be created."
  }
}

run "no_actions_no_bindings" {
  command = plan

  assert {
    condition     = length(auth0_trigger_actions.bindings) == 0
    error_message = "Without actions there must be no binding resources."
  }
}

run "rejects_fractional_trigger_order" {
  command = plan

  variables {
    actions = [
      { name = "Alpha", code = "x", deploy = true, trigger_order = 1.5 },
    ]
  }

  expect_failures = [var.actions]
}

# Upgrade from v1.10.0: per-action bindings are forgotten, not destroyed, and
# one per-trigger binding takes over.
run "legacy_per_action_bindings" {
  command   = apply
  state_key = "upgrade"

  module {
    source = "./tests/fixtures/legacy_trigger_binding"
  }

  variables {
    actions = [
      { name = "Alpha", code = "x", runtime = "node22", supported_triggers = { id = "post-login", version = "v3" }, deploy = true },
      { name = "Password changed", code = "x", runtime = "node22", supported_triggers = { id = "post-change-password", version = "v2" }, deploy = true },
    ]
  }

  assert {
    condition     = toset(keys(auth0_trigger_actions.trigger_binding)) == toset(["Alpha", "Password changed"])
    error_message = "The fixture must reproduce the per-action binding layout."
  }
}

run "upgrade_rebinds_per_trigger" {
  command   = apply
  state_key = "upgrade"

  variables {
    actions = [
      { name = "Alpha", code = "x", runtime = "node22", supported_triggers = { id = "post-login", version = "v3" }, deploy = true },
      { name = "Password changed", code = "x", runtime = "node22", supported_triggers = { id = "post-change-password", version = "v2" }, deploy = true },
    ]
  }

  assert {
    condition     = toset(keys(auth0_trigger_actions.bindings)) == toset(["post-login", "post-change-password"])
    error_message = "After the upgrade each trigger must have one binding resource."
  }

  assert {
    condition     = [for a in auth0_trigger_actions.bindings["post-login"].actions : a.display_name] == ["Alpha"]
    error_message = "The post-login binding must keep its action."
  }
}
