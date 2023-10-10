resource "yandex_compute_instance" "vm_for_each" {
  depends_on = [ yandex_compute_instance.vm_count ]
  for_each = { for res in var.vm_for_each: res.vm_name=>res }
  
  name        = each.key
  platform_id = var.vm_count_resource.platform
  
  

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = var.vm_count_resource.type_disk
      size = each.value.disk
    }   
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}