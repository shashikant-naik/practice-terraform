output "var1" {
  value= var.hello
}

output "firs_val_world" {
  value = var.world[0]
}

output "second_val_world" {
  value = var.world[1]
}

output "2nd_val_world" {
  value = element(var.world, 4)
}

output "value_in_map" {
  value = var.list["abc"]
}

output "second_in_map" {
  value = lookup(var.list,"abc1","none")
}

output "Fruits_details" {
  value = "Fruit name - apple, qty - ${var.fruits["apple"]["qty"]}
}