module "vpc"{
  source    = "./vpc"
  name      = var.vpc_name_module
  zone      = var.default_zone
  cidr      = var.default_cidr_module
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

module "vpc_multi_subnet"{
  source        = "./vpc_multi_subnet"
  name          = var.vpc_name_module
  subnets       = var.HA ? var.subnets : var.subnets_single
  zone_provider = var.default_zone
  token         = var.token
  cloud_id      = var.cloud_id
  folder_id     = var.folder_id
}

module "mysql"{
  source        = "./mysql"
  cluster_name  = var.cluster_name
  network_id    = module.vpc_multi_subnet.network_id
  version_mysql = var.version_mysql
  disk_type     = var.disk_type
  disk_size     = var.disk_size
  hosts_mysql   = module.vpc_multi_subnet.subnet 
  name_db       = var.name_db
  username      = var.username
  password      = var.password
  default_zone  = var.default_zone
  token         = var.token
  cloud_id      = var.cloud_id
  folder_id     = var.folder_id
  preset_id     = var.preset_id
  env           = var.env
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=95c286e"
  env_name        = "develop"
  network_id      = module.vpc.network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.vpc.subnet_id ]
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")

 vars = {
  ssh_public_key   = local.public_key
 }
}
