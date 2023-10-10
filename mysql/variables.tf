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
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "hosts_mysql"{
  type       = list(object({
    zone = string
    subnet_id    = string
  }))
  description = "Dynamic host resource"
}

variable  "cluster_name"{
  type         = string
  description  = "Cluster name"
}

variable  "HA"{
  type         = bool
  default      = false
  description  = "Variable for high-availability cluster(false=not HA, true=HA)"
}

variable  "version_mysql"{
  type         = string
  description  = "Version MySQL"
}

variable  "network_id"{
  type         = string
  description  = "Network Id"
}

variable  "disk_type"{
  type         = string
  description  = "Type disk"
}

variable  "disk_size"{
  type         = number
  description  = "Size disk in GB"
}

variable  "name_db"{
  type         = string
  description  = "Name db"
}

variable  "username"{
  type         = string
  description  = "User db"
}

variable  "password"{
  type         = string
  description  = "Password for user db"
}

variable  "env"{
  type         = string
  description  = "Environment for MySQL"
}

variable  "preset_id"{
  type         = string
  description  = "resource preset id"
}
