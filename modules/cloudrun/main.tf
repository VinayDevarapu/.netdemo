resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image

        env {
          name  = "DB_CONNECTION_NAME"
          value = var.sql_instance_connection
        }

        env {
          name = "DB_PASSWORD"
          value_from {
            secret_key_ref {
              name = var.secret_name
              key  = "latest"
            }
          }
        }
      }

      service_account_name = var.service_account

      vpc_access {
        connector = var.vpc_connector_name
      }

      container_concurrency = 80
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.service.name
  location = google_cloud_run_service.service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
