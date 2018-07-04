// DNS information

variable "static_zone" {
  type        = "string"
  default     = ""
  description = "Zone name to create DNS record set under, using ClouDNS"
}
variable "static_name" {
  type = string
  default = ""
  description = "Name of A record to be created"
}
