output "Selenium Grid Public IP" {
  value = "${module.selenium_grid_host.public_ip}"
}

# output "App HostPublic IP" {
#   value = "${module.app_host.public_ip}"
# }
