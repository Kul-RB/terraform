###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vms_resources"{
    type = map
    default = {vm_core = 2, vm_memory = 1, vm_core_frac = 5, vm_db_core = 2, vm_db_memory = 2, vm_db_core_frac = 20}
    description = "Resource for vm"
}

variable "vms_metadata"{
    type = map
    default = {serial_port_enable = 1, ssh_keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDINA6nHAKmCkcku9T+eq0y1EawE4Iaq08N9UXxGHaNB/0OF/rrYB0P+Ca574UE25DVbhBlrjTDZ/Sqsy3sgMvTGs1ReKQR6Sk87SR8IGwt5M+a9BQmVjVSmw4AAM0SMhz1u+FgTYyEpiFxzY+NcN+TxtUd5WrwLXtu+yEGV64zgd/ts09DwnjYlNLoqXjg3dHniCfXWIOtYO1fe2aq+4/tsjsxuAOej3yAX60DuN1uqrDcAtJM74XU4+Pvv/mbxSH3zKjV9NWbm6sHGFSWjbGs2YCwN6UBeMSkSpsAxwMmkfguaU9XRIfz6Ikx98R558dzPpgZJU96x4OJ/jj+w2sXaSUoATr4eK71KJS13d4S2RuE0CFsG2PKteZ/hVWdOu8bUGcwhEh8HWWOM7tabeSI35Uch4IvKML1cB3cAc4AVfphlOUgQ2WlmtXfrQBt8XSQGS9OtfUPPUsd1Fi+nqJDzxfMI/QYBM7ucgtIkRI+z5eBqBSU4eWcdJ4cfNUJ2qM= cfdata@workernode" }
}

variable "vm_name"{
  type        = string 
  default     = "netology-develop-platform-web"
  description = "Name virtual machine"
}

variable "vm_platform"{
  type        = string 
  default     = "standard-v1"
  description = "Platform for virtual machine"
}

variable "vm_family_os"{
  type        = string 
  default     = "ubuntu-2004-lts"
  description = "Famili OS for virtual machine"
}

variable "vm_db_name"{
  type        = string 
  default     = "netology-develop-platform-db"
  description = "Name virtual machine"
}
