output "var1" {
  value= var.hello
}

output "firs_val_world" {
  value = var.world[0]
}

output "second_val_world" {
  value = var.world[1]
}

output "second_val_element_world" {
  value = element(var.world, 4)
}

output "value_in_map" {
  value = var.list["abc"]
}

output "second_in_map_lookup" {
  value = lookup(var.list,"abc1","none")
}

output "Fruits_details" {
  value = "Fruit name - apple, qty - ${var.fruits.apple.qty}"
}

output "Orange_price_lookup" {
  value = "Orange Price: ${lookup(var.fruits,["orange"]{"price"],"none")}"
}