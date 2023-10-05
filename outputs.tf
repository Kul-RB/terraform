output "resource_info"{

    value =  [
        {for k, i in  yandex_compute_instance.vm_count: k => {"fqdn" = i.fqdn,  "id" =  i.id,  "name" = i.name }},
        {for k, i in  yandex_compute_instance.vm_for_each: k => {"fqdn" = i.fqdn,  "id" =  i.id,  "name" = i.name }},
        {for k, i in  [yandex_compute_instance.vm_storage]: k => {"fqdn" = i.fqdn,  "id" =  i.id,  "name" = i.name}}]
}