

module "selenium_grid_host" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "1.21.0"

  associate_public_ip_address = true

  instance_count         = 1

  ami                    = "${data.aws_ami.latest-ubuntu.id}"
  instance_type          = "t2.micro"
  key_name               = "${var.AWS_PEM_KEY}"
  monitoring             = true
  vpc_security_group_ids = ["${aws_default_security_group.default.id}"]
  subnet_id              = "${var.AWS_SUBNET}"

  name                   = "Selenium Grid"

  tags = {
    Terraform = "true"
    Environment = "${var.APP_ENV}"
    Name                   = "Selenium Grid"
  }
}
