provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host                   = module.Kubernetes.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.Kubernetes.cluster_ca_certificate)
}

data "google_client_config" "default" {}

module "APIs" {
  source     = "./modules/Apis"
  project_id =  var.project_id
}

module "Kubernetes" {
  source       = "./modules/Kubernetes"
  project_id   = var.project_id
  cluster_name = var.cluster_name
  zone         = var.zone
  node_count   = var.node_count
  machine_type = var.machine_type
  registry_url = module.artifact_registry.registry_url
  depends_on    = [module.APIs]
}

module "artifact_registry" {
  source    = "./modules/Registry"
  project_id = var.project_id
  region     = var.region
}

module "website_storage" {
  source    = "./modules/Storage"
  project_id = var.project_id
}

module "website_loadbalancer" {
  source     = "./modules/LoadBalancer"
  project_id = var.project_id
  depends_on = [module.website_storage]
  storage_bucket_name = module.website_storage.website_bucket_name
}

module "cloud_function" {
  source     = "./modules/Functions"
  project_id = var.project_id
  region     = var.region
}