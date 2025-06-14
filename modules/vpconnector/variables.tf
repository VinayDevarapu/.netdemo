variable "connector_name" {
  type        = string
  description = "Name of the VPC Access connector"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "network" {
  type        = string
  description = "VPC network name"
}

variable "ip_cidr_range" {
  type        = string
  description = "IP CIDR range for the connector"
}
