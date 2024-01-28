#provider "aws" {
#  region = "us-east-1"
#  # shared_credentials_files = ["~/.aws/config"]
#}

resource "aws_instance" "instances" {
  count                   = length(var.components)
  ami                     = data.aws_ami.centos8.image_id
  instance_type           = var.instance_type
  vpc_security_group_ids  = [var.vpc_security_group_ids]

  tags = {
    Name = "${element(var.components, count.index)}-dev"
  }
}

resource "aws_route53_record" "records" {
  count   = length(var.components)
  name    = "${element(var.components, count.index)}-dev"
  type    = "A"
  ttl     = 30
  zone_id = var.zone_id #Copy from console
  records = [element(aws_instance.instances.*.private_ip, count.index)]
}

