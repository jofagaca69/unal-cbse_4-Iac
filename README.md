Proyecto de Despliegue de Microservicios en GKE con Terraform y Docker

Este proyecto implementa una infraestructura automatizada en Google Kubernetes Engine (GKE) para el despliegue de microservicios. Utiliza Terraform para la infraestructura como código y Docker para la contenedorización de servicios.

🛠️ Tecnologías

	•	Terraform: Configuración y despliegue de infraestructura.
	•	Docker: Contenedorización de aplicaciones para despliegue consistente.
	•	Google Kubernetes Engine (GKE): Orquestación y administración de contenedores.
	•	Artifact Registry: Almacenamiento seguro de imágenes Docker.

🚀 Instrucciones Básicas

1. Clonar el Repositorio

2. Configurar Variables en Terraform

Edita el archivo terraform.tfvars y reemplaza con tus valores:

project_id   = "TU_PROYECTO_ID"
region       = "us-central1"
zone         = "us-central1-a"
cluster_name = "mi-cluster"
node_count   = 2

3. Construir y Subir Imágenes Docker

Desde cada carpeta de microservicio, construye y sube la imagen a Artifact Registry:

4. Desplegar Infraestructura con Terraform

terraform init
terraform apply


📦 Limpieza

Para borrar todos los recursos desplegados:

terraform destroy


Estructura del Proyecto

proyecto-gke/
├── iac-laboratory/                      # Configuración de infraestructura como código (IaC) usando Terraform
│   ├── main.tf                          # Archivo principal de configuración de Terraform
│   ├── variables.tf                     # Definición de variables para personalización
│   ├── terraform.tfvars                 # Valores específicos de variables
│   
│   ├── modules/                         # Módulos para la organización de recursos de infraestructura
│   │   ├── Apis/                        # Módulo para configuraciones de APIs en GCP
│   │   │   ├── main.tf                  # Configuración de habilitación de APIs
│   │   │   └── variables.tf             # Variables específicas del módulo Apis
│   │   
│   │   ├── Kubernetes/                  # Módulo para configuración de recursos de Kubernetes
│   │   │   ├── main.tf                  # Creación del cluster y recursos de GKE
│   │   │   ├── pods.tf                  # Configuración de pods de Kubernetes para microservicios
│   │   │   ├── services.tf              # Configuración de servicios en Kubernetes para balanceo de carga
│   │   
│   │   └── Registry/                    # Módulo para configuración del Artifact Registry
│   │       ├── main.tf                  # Creación y permisos para Artifact Registry
│   │       └── variables.tf