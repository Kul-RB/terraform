resource "yandex_mdb_mysql_cluster" "mysql" {
  name                = var.cluster_name
  environment         = var.env
  network_id          = var.network_id
  version             = var.version_mysql
  security_group_ids  = [ var.security_group_id ]
  deletion_protection = false

  resources {
    resource_preset_id = var.preset_id
    disk_type_id       = var.disk_type
    disk_size          = var.disk_size
  }

  dynamic "host" {
    for_each          = var.hosts_mysql 
    content {
    zone              = lookup(host.value, "zone", null)
    subnet_id         = lookup(host.value, "subnet_id", null)
    assign_public_ip  = false
    }
   }

}



resource "yandex_mdb_mysql_database" "db" {
    
    cluster_id = yandex_mdb_mysql_cluster.mysql.id
    name       = var.name_db
}

resource "yandex_mdb_mysql_user" "app" {
    
    cluster_id = yandex_mdb_mysql_cluster.mysql.id
    name       = var.username
    password   = var.password
    permission {
      database_name = yandex_mdb_mysql_database.db.name
      roles         = ["ALL"]
    }
}