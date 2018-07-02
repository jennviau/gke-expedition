// DNS information
variable "static_name" {
  type        = "string"
  default     = "keycloak-static-ip"
  description = "Display name for Static IP"
}

variable "static_zone" {
  type        = "string"
  default     = "automateit"
  description = "Zone name to create DNS record set under, using ClouDNS"
}
