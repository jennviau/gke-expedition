// DNS information
variable "zone_name" {
  type        = "string"
  default     = ""
  description = "Zone name to create DNS record set under, using ClouDNS"
}

variable "record_name" {
  type        = "string"
  default     = ""
  description = "Name of A record to be created"
}

variable "ip_address" {
  default = ""
}
