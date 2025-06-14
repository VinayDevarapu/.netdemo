resource "google_vpc_access_connector" "connector" {
  name          = var.connector_name
  region        = var.region
  network       = var.network
  ip_cidr_range = var.ip_cidr_range
}
