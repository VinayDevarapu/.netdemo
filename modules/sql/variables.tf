variable "instance_name" {
  type        = string
  description = "Cloud SQL instance name"
  default = "SQL-Demo-Instance"
}

variable "region" {
  type        = string
  description = "Region of SQL instance"
  default = "us-central1"
}

variable "network" {
  type        = string
  description = "VPC network name for private IP"
}

