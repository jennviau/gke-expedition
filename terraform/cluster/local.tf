variable "project_name" {
  type    = "string"
  default = "keycloak-208622"
}

variable "region" {
  type    = "string"
  default = "northamerica-northeast1"
}

variable "cluster_name" {
  type    = "string"
  default = "expedition"
}

variable "master_username" {
  type    = "string"
  default = "keycloak-admin"
}

variable "master_password" {
  type    = "string"
  default = "eycloak-cluster-admin"
}

variable "image_type" {
  type    = "string"
  default = "COS"
}

variable "node_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "initial_node_count" {
  type    = "string"
  default = 2
}
