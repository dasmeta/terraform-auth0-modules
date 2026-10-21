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

run "default_syncs_root_attributes_on_each_login" {
  command = plan

  variables {
    name = "profile-sync-default"
  }

  assert {
    condition     = auth0_connection.my-database-connection.options[0].set_user_root_attributes == "on_each_login"
    error_message = "The database connection must sync root attributes on each login by default."
  }
}
