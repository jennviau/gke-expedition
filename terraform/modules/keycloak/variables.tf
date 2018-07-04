//kubernetes connection information
variable "host" {}
variable "client_certificate" {}
variable "client_key" {}
variable "cluster_ca_certificate" {}

//Used by Both DB and APP
variable "name_space" {
  type    = "string"
  default = ""
}

variable "db_user"{
  default = "keycloak"
}

variable "db_password" {
  default = "keycloak"
}

variable "db_instance_name" {
  default = "keycloak"
}

//DB Specific
variable "db_image" {
  default = ""
}

variable "db_name" {
  type    = "string"
  default = "mariadb"
}

variable "db_replicas" {
  default = "3"
}

variable "db_service_name" {
  type    = "string"
  default = "mysql"
}

//App Specific
variable "app_image" {
  type    = "string"
  default = ""
}

variable "app_name" {
  type    = "string"
  default = ""
}

variable "app_service_name" {
  type    = ""
  default = ""
}

variable "keycloak_admin_user" {
  default = "keycloak"
}

variable "keycloak_admin_pass" {
  default = "keycloak"
}