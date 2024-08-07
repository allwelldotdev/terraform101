locals {
  double_numbers = [for num in var.numbers_list : num * 2]
  even_numbers   = [for num in var.numbers_list : num * 2 if num % 2 == 0]
  firstnames     = [for person in var.objects_list : person.firstname]
  fullnames      = [for person in var.objects_list : "${person.firstname} ${person.lastname}"]
}

output "doubles_list" {
  value = local.double_numbers
}

output "even_list" {
  value = local.even_numbers
}

output "firstnames" {
  value = local.firstnames
}

output "fullnames" {
  value = local.fullnames
}
