variable "zone" {
  type        = string
  description = "VPC zone"
}
variable "cidr" {
  type        = list(string)
  description = "VPC subnet"
}

variable "name" {
  type        = string
  description = "VPC network&subnet name"
}

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
