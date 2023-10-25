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
  description = "VPC network&subnet name"
}

variable "default_cidr_module" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name_module" {
  type        = string
  default     = "develop_module"
  description = "VPC network&subnet name"
}

variable "vpc_name_ha_module" {
  type        = string
  default     = "develop_module_ha"
  description = "VPC network&subnet name"
}
###common vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}

variable "subnets" {
  type        = list(object({ zone=string, cidr=string}))
  default     = [
    { zone = "ru-central1-a", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.3.0/24" }
    ]
  description = "subnet variable for module"
}

variable "subnets_single" {
  type        = list(object({ zone=string, cidr=string}))
  default     = [
    { zone = "ru-central1-a", cidr = "10.0.2.0/24" }
    ]
  description = "subnet variable for module"
}

variable  "cluster_name"{
  type         = string
  default      = "example"
  description  = "Cluster name"
}

variable  "HA"{
  type         = bool
  default      = true
  description  = "Variable for high-availability cluster(false=not HA, true=HA)"
}

variable  "version_mysql"{
  type         = string
  default      = "8.0"
  description  = "Version MySQL"
}

variable  "disk_type"{
  type         = string
  default      = "network-ssd"
  description  = "Type disk"
}

variable  "disk_size"{
  type         = number
  default      = 32
  description  = "Size disk in GB"
}

variable  "name_db"{
  type         = string
  default      = "test"
  description  = "Name db"
}

variable  "username"{
  type         = string
  default      = "app"
  description  = "User db"
}

variable  "password"{
  type         = string
  description  = "Password for user db"
}

variable  "env"{
  type         = string
  default      = "PRESTABLE"
  description  = "Environment for MySQL"
}
variable  "preset_id"{
  type         = string
  default      = "s2.micro"
  description  = "resource preset id"
}

variable "check_id" {
  type         = string
  description  = "IP-address"
  default      = "192.168.0.1"
  validation {
    condition     = can(regex("^\\d{1,3}[.]\\d{1,3}[.]\\d{1,3}[.]\\d{1,3}", var.check_id))
    error_message = "Invalid IP"
  }
}

variable "check_list_ip" {
  type          = list(string)
  description   = "List IP-address"
  default       = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  validation {
    condition     = alltrue([
      for ip in var.check_list_ip:
       can(regex("^\\d{1,3}[.]\\d{1,3}[.]\\d{1,3}[.]\\d{1,3}", ip))
    ])
    error_message = format("Invalid IP %s from list", join(", ", [for ip in var.check_list_ip: 
       ip if !can(regex("^\\d{1,3}[.]\\d{1,3}[.]\\d{1,3}[.]\\d{1,3}", ip)) ]))
  }
}


variable "check_upper" {
  type          = string
  description   = "Any string without upper"
  default       = "terraform upper check"

  validation {
    condition     = !can(regex("[[:upper:]]", var.check_upper))
    error_message = "There is upper case"
  }
} 

variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = var.in_the_end_there_can_be_only_one.Dunkan == var.in_the_end_there_can_be_only_one.Connor ? false : true
    }
}