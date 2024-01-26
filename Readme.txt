Argument:
An argument assigns a value to a particular name:
image_id = "abc123"

Block:
A block is a container for other content:
resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}

Identifiers:
Argument names, block type names, and the names of most Terraform-specific constructs like resources, input variables, etc. are all identifiers.


resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}

<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}

-----------

Types of Blocks in Terraform:
1. Terraform Block
    specify settings for the Terraform execution environment, such as the required Terraform version and any backend configuration settings
        terraform {
          required_version = ">= 0.14"
          backend "s3" {
            bucket = "my-terraform-state"
            key    = "terraform.tfstate"   region = "us-west-2" }  }

2. Provider Block
   used to configure and define the provider for a specific cloud or infrastructure program
        provider "aws" { region = "us-west-2" }

3. Resource Block
    declare and define the Resources like components such as virtual machines, networks, ec2
        resource "aws_instance" "example"
        { ami = "ami-0c94855ba95c71c99"
        instance_type = "t2.micro" }

4. Data Block
    used to fetch data from external sources or existing resources
        data "aws_vpc" "existing_vpc" { id = "vpc-12345678" }

5. Module Block
    Specifies a reusable set of resources and configurations. Modules can be used to organize and reuse code across multiple Terraform configurations.
            module "vpc" { source = "./modules/vpc" region = "us-west-2" }

6. Variable Block
    defines variables that can be used in a Terraform configuration
        variable "aws_region" {
          type = string
          default = "us-west-2"      }

7. Output Block
    defines the values that Terraform should output after applying a configuration.
        output "public_ip" {
          value = aws_instance.example.public_ip        }

8. Locals Block
    Defines local values that can be used within a Terraform module or configuration file.
        locals { instance_name = "my-instance" }
--------

Every resource wll have Argument reference, Attribute reference

provider => aws
module   => s3_bucket

Init -> Plan -> Apply -> Destroy

File types:
.tf

versions.tf         outputs.tf      variables.tf
main.tf

---
Terraform Install:
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
----





