resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_family_os
}
resource "yandex_compute_instance" "platform" {
  name        = local.platform
  platform_id = var.vm_platform
  resources {
    cores         = var.vms_resources.vm_core
    memory        = var.vms_resources.vm_memory
    core_fraction = var.vms_resources.vm_core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.serial_port_enable
    ssh-keys           = var.vms_metadata.ssh_keys
  }

}
resource "yandex_compute_instance" "db" {
  name        = local.db
  platform_id = var.vm_platform
  resources {
    cores         = var.vms_resources.vm_db_core
    memory        = var.vms_resources.vm_db_memory
    core_fraction = var.vms_resources.vm_db_core_frac
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.serial_port_enable
    ssh-keys           = var.vms_metadata.ssh_keys
  }

}

