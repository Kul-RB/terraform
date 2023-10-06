resource "yandex_vpc_network" "develop" {
  name = var.name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.name
  zone           = var.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr
}

output "subnet" {
  value       = "${yandex_vpc_subnet.develop}"
  description = "Inforamtion VPC"
}
output "subnet_id" {
  value       = "${yandex_vpc_subnet.develop.id}"
  description = "Inforamtion VPC"
}
output "network_id" {
  value       = "${yandex_vpc_network.develop.id}"
  description = "Inforamtion VPC"
}