variable "hello" {
  default = "Hello SK"
}

# List
variable "world" {
  default = ["Hello world", 399, true]
}

# map
variable "list" {
  default = {
    abc = 111
    xyz = "Two hundred"
  }
}

variable "fruits" {
  default = {
    apple = {
      price = 12
      qty = 5
    }
    orange = {
      price = 20
      qty = 30
    }
  }
}