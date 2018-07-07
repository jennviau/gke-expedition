variable "cluster_name" {
  type    = "string"
  default = "keycloak-ha"
}

variable "region_name" {
  type    = "string"
  default = "keycloak-ha"
}

variable "master_username" {
  type    = "string"
  default = "keycloak-admin"
}

variable "master_password" {
  type    = "string"
  default = "keycloak-cluster-admin"
}

variable "image_type" {
  type    = "string"
  default = "COS"
}

variable "node_type" {
  type    = "string"
  default = "n1-standard-1"
}

variable "zones" {
  type    = "list"
  default = []
}

variable "project" {
  default = ""
}

variable "gke_min_master_version" {
  default = "1.9.7-gke.3"
}

variable "zone_amount" {
  default = 2
}

variable "daily_maintenance_window" {
  default = "02:00"
}

variable "cluster_node_count" {
  type    = "string"
  default = 2
}

variable "enable_legacy_abac" {
  default = "true"
}

variable "disk_size" {
  default = "100"
}
