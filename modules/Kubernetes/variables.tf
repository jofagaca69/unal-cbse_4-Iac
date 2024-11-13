variable "project_id" {
  description = "El ID del proyecto de Google Cloud."
  type        = string
}

variable "cluster_name" {
  description = "Nombre del clúster de Kubernetes."
  type        = string
  default     = "mi-cluster"
}

variable "region" {
  description = "Región donde se creará el clúster."
  type        = string
  default     = "us-central1"
}

variable "node_count" {
  description = "Cantidad de nodos en el clúster."
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Tipo de máquina para los nodos del clúster."
  type        = string
  default     = "e2-small"
}

variable "zone" {
  description = "Zona donde se creará el clúster."
  type        = string
  default     = "us-east1-d"  
  }

variable "registry_url" {
  description = "URL del Artifact Registry para imágenes Docker."
  type        = string
}