variable "subnets" {
  type        = list(object({ zone=string, cidr=string}))
  description = "VPC zone"
}

variable "name" {
  type        = string
  description = "VPC network&subnet name"
}
variable "zone_provider" {
  type        = string
  description = "zone provider"
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
