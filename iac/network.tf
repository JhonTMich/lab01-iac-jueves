resource "docker_network" "network" {
  name = "${terraform.workspace}_network"
}