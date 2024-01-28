variable "ami" {
  default = "ami-0f3c7d07486cad139"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_security_group_ids" {
  default = ["sg-020d530177af68806"]
}

variable "zone_id" {
  default = "Z07947133KI5JSIYK8TJ6"
}