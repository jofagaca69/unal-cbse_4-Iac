variable "region" {
    type = string
    default = "region"  
}

variable "database_name"{
    type = string
    description = "nombre de la base de datos"
}

variable "project_id" {
    type = string  
}

variable "cluster_name" {
  description = "Nombre del clúster de Kubernetes."
  type        = string
  default     = "mi-cluster"
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