resource "kubernetes_config_map" "backend-config" {
  metadata {
    name = "backend-config"
  }

  data = {
    DATABASE_HOST  = "34.48.191.216"
    DATABASE_PORT      = "3306"
    DATABASE_USERNAME = "developers"
    DATABASE_PASSWORD = "jangoldb"
    DATABASE_NAME = "jangoldb"
  }
}