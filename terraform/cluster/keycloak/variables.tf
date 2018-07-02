//App Specific
variable "db_image" {
  default = "gcr.io/keycloak-208622/mariadb:10.1"
}

variable "db_name" {
  default = "mariadb"
}

variable "db_service_name" {
  default = "mysql"
}

//App Specific
//App Specific
variable "app_image" {
  default = "gcr.io/keycloak-208622/keycloak-ha-mysql:latest"
}

variable "app_name" {
  default = "keycloak"
}

variable "app_service_name" {
  default = "keycloak"
}

variable "name_space" {
  type    = "string"
  default = "keycloak"
}
