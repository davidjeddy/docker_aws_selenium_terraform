resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_default_vpc.default.id}"

  ingress {
    protocol  = "TCP"
    self      = true
    from_port = 22
    to_port   = 22
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 4444
    to_port     = 4444
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
