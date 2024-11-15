# modules/Functions/main.tf

# Bucket para almacenar el código fuente de la función
resource "google_storage_bucket" "function_source_bucket" {
  name          = "${var.project_id}-function-source"
  location      = var.region
  force_destroy = true
}

# Subir el archivo ZIP con el código de la función
resource "google_storage_bucket_object" "function_zip" {
  name   = "unal-cbse_4-Backend-MS3.zip"  # Nombre del archivo en el bucket
  bucket = google_storage_bucket.function_source_bucket.name
  source = "${path.module}/unal-cbse_4-Backend-MS3.zip"  # Ruta relativa a la ubicación del ZIP
}

# Crear la Cloud Function
resource "google_cloudfunctions_function" "payment_function" {
  name        = "payment-http-function"
  description = "HTTP Cloud Function para procesar pagos"
  runtime     = "nodejs18"  # Cambia según el runtime que necesites
  entry_point = "payment"   # Punto de entrada definido en el código de la función
  region      = var.region

  trigger_http          = true
  source_archive_bucket = google_storage_bucket.function_source_bucket.name
  source_archive_object = google_storage_bucket_object.function_zip.name
  available_memory_mb   = 256

  environment_variables = {
    DATABASE_ID = "jangoldb-nosql"
  }
}

# Permisos para que todos puedan invocar la función
resource "google_cloudfunctions_function_iam_member" "invoker_permission" {
  project        = google_cloudfunctions_function.payment_function.project
  region         = google_cloudfunctions_function.payment_function.region
  cloud_function = google_cloudfunctions_function.payment_function.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"
}