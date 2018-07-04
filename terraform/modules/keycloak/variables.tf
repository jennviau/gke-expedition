//kubernetes connection information
variable "host" {}
variable "client_certificate" {}
variable "client_key" {}
variable "cluster_ca_certificate" {}


//DB Specific
variable "db_image" {
  default = ""
}

variable "db_name" {
  type    = "string"
  default = ""
}

variable "db_service_name" {
  type    = "string"
  default = ""
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
  type    = "string"
  default = ""
}

variable "name_space" {
  type    = "string"
  default = ""
}
