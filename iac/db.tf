resource "docker_container" "db" {
  name  = "db-${terraform.workspace}"
  image = "postgres:16-alpine"

  env = [
    "POSTGRES_PASSWORD=${var.db_password[terraform.workspace]}"
  ]

  networks_advanced {
    name = docker_network.network.name
  }

  ports {
    internal = "5432"
    external = var.db_port[terraform.workspace]
  }
    
}
