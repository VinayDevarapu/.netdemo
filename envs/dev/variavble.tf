variable "service_name" {
  type        = string
  description = "Cloud Run service name"
}

variable "image" {
  type        = string
  description = "Container image URL"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "service_account" {
  type        = string
  description = "Service account for Cloud Run"
}

variable "sql_instance_connection" {
  type        = string
  description = "Cloud SQL instance connection name"
}

variable "vpc_connector_name" {
  type        = string
  description = "Serverless VPC Access Connector name"
}

variable "secret_name" {
  type        = string
  description = "Secret Manager secret name"
}
