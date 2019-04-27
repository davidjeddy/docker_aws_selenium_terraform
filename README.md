ADSL

(AWS + Docker + Selenium (Grid) + Terrform)

# Install

```bash
git clone ...
cd ./...
terraform init
```

# Usage

```bash
cp .env.dist .env
# open and provide values
terraform plan --out ./out.plan -var-file=.env
terraform apply
```

# Prereq
- [AWS CLI API credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-iam-create-creds.html)
- [Linux Terminal](https://en.wikipedia.org/wiki/Linux_console)
- [SSH](https://en.wikipedia.org/wiki/Secure_Shell)
- [Terraform](https://en.wikipedia.org/wiki/Terraform_(software))


# Remove

```bash
terraform destory
```
