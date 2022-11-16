resource "auth0_connection" "google_oauth2" {
  name     = "google-oauth2"
  strategy = "google-oauth2"
  # is_domain_connection = var.is_domain_connection
  # enabled_clients      = var.enabled_clients
  # realms = [
  #   "google-oauth2",
  # ]
}
