#provider "aws" {
#  region = "us-east-1"
#  # shared_credentials_files = ["~/.aws/config"]
#}

resource "aws_instance" "instances" {
  for_each                = var.components
  ami                     = data.aws_ami.centos8.image_id
  instance_type           = lookup(each.value,"instance_type","t2.micro")
  vpc_security_group_ids  = [var.vpc_security_group_ids]

  tags = {
    Name = lookup(each.value, "name",null)-dev
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components
  name     = lookup(each.value, "name", null)
  type     = "A"
  ttl      = 30
  zone_id  = var.zone_id #Copy from console
  records  = [lookup(lookup(aws_instance.instances, each.key, null),"private_ip", null)]
  [element(aws_instance.instances.*.private_ip, count.index)]
}

