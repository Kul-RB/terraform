resource "yandex_compute_disk" "vd_count"{
    count    = 3
    name     = "netology-vd-${count.index}"
    type     = "network-ssd"
    zone     = var.default_zone
    size     = 5

   
}

resource "yandex_compute_instance" "vm_storage"{
    depends_on = [ yandex_compute_disk.vd_count ]
    name         = var.vm_storages.vm_name
    platform_id  = "standard-v1"

    resources {
        cores           = var.vm_storages.cpu
        memory        = var.vm_storages.ram
        core_fraction = var.vm_storages.core_fraction
    }
    
    boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = 5
    }   
    }

    dynamic "secondary_disk"{
        for_each = toset("${yandex_compute_disk.vd_count[*].id}")
        content {
        disk_id = secondary_disk.value
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