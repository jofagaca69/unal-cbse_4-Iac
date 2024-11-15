
resource "google_project_service" "cloud_run" {
  project = var.project_id
  service = "run.googleapis.com"
}


# Habilita la API de Cloud Functions
resource "google_project_service" "cloudfunctions" {
  project = var.project_id
  service = "cloudfunctions.googleapis.com"
}

# Habilita la API de Cloud Storage para almacenar el código de la función
resource "google_project_service" "storage" {
  project = var.project_id
  service = "storage.googleapis.com"
  disable_dependent_services = true
}

# Habilita la API de Kubernetes
resource "google_project_service" "kubernetes_api" {
  project = var.project_id
  service = "container.googleapis.com"
}

