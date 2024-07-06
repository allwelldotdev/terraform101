locals {
  users_map         = { for user_info in var.users : user_info.username => user_info.roles... }
  users_map2        = { for username, roles in local.users_map : username => { roles = roles } }
  username_from_map = [for username, roles in local.users_map : username]
}

output "users_map" {
  value = local.users_map
}

output "users_map2" {
  value = local.users_map2
}

output "user_to_output" {
  value = local.users_map2[var.user_to_output].roles
}

output "username_from_map" {
  value = local.username_from_map
}
