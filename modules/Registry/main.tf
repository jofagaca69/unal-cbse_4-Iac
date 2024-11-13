resource "google_artifact_registry_repository" "docker_registry" {
  provider    = google
  project     = var.project_id
  location    = var.region
  repository_id = "backend-ms-registry"
  description = "Artifact Registry for Docker images"
  format      = "DOCKER"
}