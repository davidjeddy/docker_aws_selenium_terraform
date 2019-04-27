output "Selenium Grid Public DNS" {
  value = "${module.selenium_grid_host.public_dns}"
}

output "Web App Public DNS" {
  value = "${module.web_app_host.public_dns}"
}

output "SSH pem key" {
  value = "${var.AWS_PEM_KEY}"
}