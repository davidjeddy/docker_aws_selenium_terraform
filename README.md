ADSL

(AWS + Docker + Selenium (Grid) + Terrform)

# About

A Selenium Grid example and a Java web app example usage.

# Install

```bash
git clone ...
cd ./...
terraform init
```

# Usage

```bash
cp .env.dist .env
# open and provide values, save and exit editor

terraform plan --out ./out.plan -var-file=.env
terraform apply -lock=true ./out.plan

ssh -i ~/.ssh/$(terraform output "SSH pem key").pem ubuntu@$(terraform output "Web App Public DNS") "cd /home/ubuntu/spring-petclinic && sudo mvn test -Dtest=SeleniumExampleTest -DSG_FQDN=\"$(terraform output "Selenium Grid Public DNS")\" -DWEB_APP_FQDN=\"$(terraform output "Web App Public DNS")\""
```

# Prereq
- [AWS CLI API credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-iam-create-creds.html)
- [Linux Terminal](https://en.wikipedia.org/wiki/Linux_console)
- [SSH](https://en.wikipedia.org/wiki/Secure_Shell)
- [Terraform](https://en.wikipedia.org/wiki/Terraform_(software))


# Remove

```bash

terraform destroy  -var-file=.env
```
