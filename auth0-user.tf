module "auth0_users" {
  source = "./modules/auth0-user/"

  users = var.users
}
