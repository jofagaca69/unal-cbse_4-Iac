resource "kubernetes_service" "gateway_service" {
  metadata {
    name = "gateway-service"
    labels = {
      app = "gateway"
    }
  }

  spec {
    selector = {
      app = "gateway"
    }

    port {
      port        = 80       
      target_port = 3000     
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "microservice_1_service" {
  metadata {
    name = "microservice-1-service"
    labels = {
      app = "microservice-1"
    }
  }

  spec {
    selector = {
      app = "microservice-1"
    }

    port {
      port        = 80       
      target_port = 3001     
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "microservice_2_service" {
  metadata {
    name = "microservice-2-service"
    labels = {
      app = "microservice-2"
    }
  }

  spec {
    selector = {
      app = "microservice-2"
    }

    port {
      port        = 80      
      target_port = 3002     
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "microservice_3_service" {
  metadata {
    name = "microservice-3-service"
    labels = {
      app = "microservice-3"
    }
  }

  spec {
    selector = {
      app = "microservice-3"
    }

    port {
      port        = 80       
      target_port = 3002     
    }

    type = "LoadBalancer"
  }
}