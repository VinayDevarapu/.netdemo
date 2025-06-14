variable "network_name" {
  type        = string
  description = "Name of the VPC network"
  default = "vinay-network1"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
  default = "vinay-subnet1"
}

variable "subnet_range" {
  type        = string
  description = "CIDR range of the subnet"
}

variable "region" {
  type        = string
  description = "GCP region"
}
