locals {
  auth0_google = [
    {
      name = "google-oauth2"
      enabled_clients = [
        "**************",
        "**************",
      ]
    }
  ]
}
