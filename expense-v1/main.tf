provider "aws" {
  region = "us-east-1"
  # shared_credentials_files = ["~/.aws/config"]
}

resource "aws_instance" "frontend" {
  ami                     = "ami-0f3c7d07486cad139"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = ["sg-020d530177af68806"]

  tags = {
    Name = "frontend-dev"
  }
}

resource "aws_route53_record" "frontend" {
  name    = "frontend-dev"
  type    = "A"
  ttl     = 30
  zone_id = "Z07947133KI5JSIYK8TJ6" #Copy from console
  records = [aws_instance.frontend.public_ip]
}

resource "aws_instance" "backend" {
  ami                     = "ami-0f3c7d07486cad139"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = ["sg-020d530177af68806"]

  tags = {
    Name = "backend-dev"
  }
}

resource "aws_route53_record" "backend" {
  name    = "frontend-dev"
  type    = "A"
  ttl     = 30
  zone_id = "Z07947133KI5JSIYK8TJ6" #Copy from console
  records = [aws_instance.backend.public_ip]
}

resource "aws_instance" "mysql" {
  ami                     = "ami-0f3c7d07486cad139"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = ["sg-020d530177af68806"]

  tags = {
    Name = "mysql-dev"
  }
}

resource "aws_route53_record" "mysql" {
  name    = "frontend-dev"
  type    = "A"
  ttl     = 30
  zone_id = "Z07947133KI5JSIYK8TJ6" #Copy from console
  records = [aws_instance.mysql.public_ip]
}