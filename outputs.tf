output "db" {
  value       = "${yandex_compute_instance.db.network_interface.0.nat_ip_address}"
}

output "platform"{
  value       = "${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}