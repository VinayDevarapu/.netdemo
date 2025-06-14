output "secret_name" {
  value = google_secret_manager_secret.secret.secret_id
}
