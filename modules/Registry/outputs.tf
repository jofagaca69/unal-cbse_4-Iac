output "registry_url" {
  value = "us-east1-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker_registry.repository_id}"
}