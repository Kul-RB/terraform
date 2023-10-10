resource "yandex_vpc_network" "develop" {
  name  = var.name
}

resource "yandex_vpc_subnet" "develop" {
  for_each       = {for res in var.subnets: res.zone => res } 
  name           = "${var.name}-${index(var.subnets, each.value)}"
  zone           = each.key
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value.cidr]
}

output "subnet" {
  value       = [ 
    for k, v in  yandex_vpc_subnet.develop : 
      {
      zone = v.zone 
      subnet_id = v.id 
      } 
    ]
  description = "Inforamtion VPC"
}
output "network_id" {
  value       = "${yandex_vpc_network.develop.id}"
  description = "Inforamtion VPC"
}