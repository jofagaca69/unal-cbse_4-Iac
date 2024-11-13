variable "project_id" {
  description = "El ID del proyecto de Google Cloud."
  type        = string
}

variable "region" {
  description = "Región donde se creará el clúster."
  type        = string
  default     = "us-central1"
}

