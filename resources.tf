

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "1.21.0"

  instance_count         = 1

  ami                    = "ami-06397100adf427136"
  instance_type          = "t2.micro"
  key_name               = "${var.AWS_PEM_KEY}"
  monitoring             = true
  vpc_security_group_ids = ["${aws_default_security_group.default.id}"]
  subnet_id              = "${var.AWS_SUBNET}"

  name                   = "Selenium Grid"

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name                   = "Selenium Grid"
  }
}