

module "vpc" {
  source       = "../.NETDEMO/modules/vpc"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_range = var.subnet_range
  region       = var.region
}

module "sql_instance" {
  source        = "../.NETDEMO/modules/sql"
  instance_name = var.instance_name
  region        = var.region
  network       = module.vpc.network_name
}

module "secret_manager" {
  source       = "../.NETDEMO/modules/secrets"
  secret_name  = var.secret_name
  secret_value = var.secret_value
}

module "vpc_connector" {
  source         = "../.NETDEMO/modules/vpc_connector"
  connector_name = var.connector_name
  region         = var.region
  network        = module.vpc.network_name
  ip_cidr_range  = var.connector_range
}

module "cloud_run_service" {
  source                  = "../.NETDEMO/modules/cloudrun"
  service_name            = var.service_name
  image                   = var.image
  region                  = var.region
  service_account         = var.service_account
  sql_instance_connection = var.sql_instance_connection
  vpc_connector_name      = module.vpc_connector.name
  secret_name             = module.secret_manager.secret_name
}


