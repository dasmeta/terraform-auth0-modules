mock_provider "auth0" {}

run "explicitly_disable_signup" {
  command = plan

  variables {
    name           = "signup-disabled"
    disable_signup = true
  }

  assert {
    condition     = auth0_connection.my-database-connection.options[0].disable_signup == true
    error_message = "The database connection must disable self-service sign-ups when requested."
  }
}

run "default_allows_signup" {
  command = plan

  variables {
    name = "signup-default"
  }

  assert {
    condition     = auth0_connection.my-database-connection.options[0].disable_signup == false
    error_message = "The database connection must allow sign-ups when disable_signup is omitted."
  }
}
