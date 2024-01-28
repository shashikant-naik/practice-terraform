resource "null_resource" "test" {
  count = 10
  }

#by providing count, resource becomes list
output "test" {
  value = null_resource.test.*.id
}

resource "aws_instance" "test" {
  count                   = 2
  ami                     = var.ami
  instance_type           = var.instance_type
  vpc_security_group_ids  = [var.vpc_security_group_ids]

  tags = {
    Name = "test-${count.index}"
  }
}