module "ec2" {
  source  = "github.com/terraform-aws-modules/terraform-aws-ec2-instance"
  version = "1.12.0"

  name           = "Selenium Grid"
  instance_count = 1

  ami           = "${data.aws_ami.latest-ubuntu.value}"
  instance_type = "t2.micro"
  key_name      = "user1"
  monitoring    = true

  vpc_security_group_ids = [
    "${aws_default_security_group.default.id}",
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Selenium Grid"
  }
}
