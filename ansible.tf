resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { webservers = { 
        webservers = yandex_compute_instance.vm_count,
        databases  = yandex_compute_instance.vm_for_each,
        storage = [yandex_compute_instance.vm_storage]
        } } )

  filename = "${abspath(path.module)}/hosts.cfg"
}