resource "kubernetes_pod" "gateway" {
  metadata {
    name = "gateway"
    labels = {
      app = "gateway"
    }
  }

  spec {
    container {
      name  = "gateway-container"
      image = "us-central1-docker.pkg.dev/jangol-440021/backend-ms/backend-gateway:0.0.2"
      
      port {
        container_port = 3000
      }

      env_from {
        config_map_ref {
          name = kubernetes_config_map.backend-config.metadata[0].name
        }
      }
    }
  }
}

resource "kubernetes_pod" "microservice-1" {
  metadata {
    name = "microservice-1"
    labels = {
      app = "microservice-1"
    }
  }

  spec {
    container {
      name  = "microservice-1"
      image = "us-central1-docker.pkg.dev/jangol-440021/backend-ms/backend-ms1:0.0.2"
      
      port {
        container_port = 3001
      }

      env_from {
        config_map_ref {
          name = kubernetes_config_map.backend-config.metadata[0].name
        }
      }
    }
  }
}

resource "kubernetes_pod" "microservice-2" {
  metadata {
    name = "microservice-2"
    labels = {
      app = "microservice-2"
    }
  }

  spec {
    container {
      name  = "microservice-2"
      image = "us-central1-docker.pkg.dev/jangol-440021/backend-ms/backend-ms2:0.0.2"
      
      port {
        container_port = 3002
      }

      env_from {
        config_map_ref {
          name = kubernetes_config_map.backend-config.metadata[0].name
        }
      }
    }
  }
}

resource "kubernetes_pod" "microservice-3" {
  metadata {
    name = "microservice-3"
    labels = {
      app = "microservice-3"
    }
  }

  spec {
    container {
      name  = "microservice-3"
      image = "us-central1-docker.pkg.dev/jangol-440021/backend-ms/backend-ms3:0.0.1"
      
      port {
        container_port = 3002
      }

      env_from {
        config_map_ref {
          name = kubernetes_config_map.backend-config.metadata[0].name
        }
      }
    }
  }
}