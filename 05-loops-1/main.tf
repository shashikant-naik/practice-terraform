resource "null_resource" "test" {
  count = 10
  }

#by providing count, resource becomes list
output "test" {
  value = null_resource.test.*.id
}