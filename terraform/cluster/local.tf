//Google Provider Info
variable "project_name" {
  type    = "string"
  default = "keycloak-208622"
}

variable "name_space" {
  type    = "string"
  default = "keycloak"
}

variable "region" {
  type    = "string"
  default = "northamerica-northeast1"
}

// Kubernetes Cluster Info
variable "cluster_name" {
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

variable "initial_node_count" {
  type    = "string"
  default = 2
}


// App Config

