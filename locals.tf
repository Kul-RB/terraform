locals {
    public_key = file("~/.ssh/id_rsa.pub")
}

locals {
    resource_info_count = [ for v in yandex_compute_instance.vm_count :
        {
     "fqdn" = v.fqdn
     "id" =  v.id
     "name" = v.name
       }]
}

locals {
    resource_info_for_each = [ for v in yandex_compute_instance.vm_for_each :
        {
     "fqdn" = v.fqdn
     "id" =  v.id
     "name" = v.name
       }]
}

locals {
    resource_info_storage = [ for v in [yandex_compute_instance.vm_storage] :
        {
     "fqdn" = v.fqdn
     "id" =  v.id
     "name" = v.name
       }]
}

locals {
    resource_info = concat(local.resource_info_count, local.resource_info_for_each, local.resource_info_storage)
}