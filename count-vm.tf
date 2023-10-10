resource "yandex_compute_instance" "vm_count" {
  count = 2
  
  name        = "netology-develop-platform-web-${count.index+1}"
  platform_id = var.vm_count_resource.platform
   

  resources {
    cores  = var.vm_count_resource.cpu
    memory = var.vm_count_resource.ram
    core_fraction = var.vm_count_resource.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = var.vm_count_resource.type_disk
      size = var.vm_count_resource.disk
    }   
  }

  metadata = {
    ssh-keys = "ubuntu:${local.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    security_group_ids = [ var.security_group_id ]
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}
