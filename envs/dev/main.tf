

module "vpc" {
  source       = "../../modules/vpc"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_range = var.subnet_range
  region       = var.region
}

module "sql_instance" {
  source        = "../../modules/sql"
  instance_name = var.instance_name
  region        = var.region
  network       = module.vpc.network_name
}

module "secret_manager" {
  source       = "../../modules/secrets"
  secret_name  = var.secret_name
  secret_value = var.secret_value
}


module "cloud_run_service" {
  source                  = "../../modules/cloudrun"
  service_name            = var.service_name
  image                   = var.image
  region                  = var.region
  service_account         = var.service_account
  sql_instance_connection = var.sql_instance_connection
  vpc_connector_name      = module.vpc_connector.name
  secret_name             = module.secret_manager.secret_name
}


