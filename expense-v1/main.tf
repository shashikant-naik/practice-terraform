provider "aws" {
  region = "us-east-1"
  # shared_credentials_files = ["~/.aws/config"]
}

resource "aws_instance" "frontend" {
  ami                     = var.ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [var.vpc_security_group_ids]

  tags = {
    Name = "frontend-dev"
  }
}

resource "aws_route53_record" "frontend" {
  name    = "frontend-dev"
  type    = "A"
  ttl     = 30
  zone_id = var.zone_id #Copy from console
  records = [aws_instance.frontend.public_ip]
}
