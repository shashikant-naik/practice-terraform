provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/config"]
}

resource "aws_instance" "frontend" {
  ami                     = "ami-0f3c7d07486cad139"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = ["sg-020d530177af68806"]

  tags = {
    Name = "frontend-dev"
  }
}