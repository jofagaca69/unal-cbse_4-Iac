# modules/Functions/variables.tf

variable "project_id" {
  description = "ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región para la función de Cloud Functions"
  type        = string
}