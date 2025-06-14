resource "google_sql_database_instance" "instance" {
  name             = var.instance_name
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      private_network = var.network
      ipv4_enabled    = false
    }
  }
}

