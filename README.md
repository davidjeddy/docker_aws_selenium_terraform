DAST

(Docker + AWS + Selenium (Grid) + Terrform)

# About

An example configuration demonstrating Selenium Grid via Docker on AWS via Terraform for IaC.

# Usage

## Install

```bash
git clone https://github.com/davidjeddy/docker_aws_selenium_terraform.git
cd ./docker_aws_selenium_terraform
cp .env.dist .env
vim .env
terraform init
```

## Execution

```bash
# build Terraform plan file
terraform plan --out ./out.plan -var-file=.env

# apply Terraform plan file
terraform apply -lock=true ./out.plan

# copy setup script for Selenium to remote host
scp -i ~/.ssh/$(terraform output "SSH pem key").pem -oStrictHostKeyChecking=no ./resources/selenium.sh ubuntu@$(terraform output "Selenium Grid Public DNS"):/home/ubuntu/selenium.sh

# ...  and execute
ssh -i ~/.ssh/$(terraform output "SSH pem key").pem -oStrictHostKeyChecking=no ubuntu@$(terraform output "Selenium Grid Public DNS") "chmod +x /home/ubuntu/selenium.sh && sudo /home/ubuntu/selenium.sh"

# copy setup script for Web App to remote host
scp -i ~/.ssh/$(terraform output "SSH pem key").pem -oStrictHostKeyChecking=no ./resources/web_app.sh ubuntu@$(terraform output "Web App Public DNS"):/home/ubuntu/web_app.sh

# ...  and execute
ssh -i ~/.ssh/$(terraform output "SSH pem key").pem -oStrictHostKeyChecking=no ubuntu@$(terraform output "Web App Public DNS") "chmod +x /home/ubuntu/web_app.sh && cd /home/ubuntu/ && sudo ./web_app.sh"

# Run Selenium tests from Web App host to Selenium Grid host
ssh -i ~/.ssh/$(terraform output "SSH pem key").pem -oStrictHostKeyChecking=no ubuntu@$(terraform output "Web App Public DNS") "cd /home/ubuntu/spring-petclinic && sudo mvn test -Dtest=SeleniumExampleTest -DSG_FQDN=\"$(terraform output "Selenium Grid Public DNS")\" -DWEB_APP_FQDN=\"$(terraform output "Web App Public DNS")\""
```

## Remove

```bash
terraform destroy -auto-approve -var-file=.env
```

# Prereq
- [AWS CLI API credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-iam-create-creds.html)
- [Linux Terminal](https://en.wikipedia.org/wiki/Linux_console)
- [SSH](https://en.wikipedia.org/wiki/Secure_Shell)
- [Terraform](https://en.wikipedia.org/wiki/Terraform_(software))
