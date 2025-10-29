# --- Configure the Docker Provider ---
terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.15" # Specify a compatible version
    }
  }
}

# Provider configuration
# Terraform will automatically connect to your local Docker daemon
provider "docker" {}

# --- Define the Infrastructure: Docker Image and Container ---

# 1. Pull the specified Docker image (e.g., Nginx)
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = true # Keep the image even after 'terraform destroy'
}

# 2. Create and run a Docker container from the pulled image
resource "docker_container" "web_container" {
  name    = "terraform-nginx-web-server"
  image   = docker_image.nginx_image.name
  
  # Configure port mapping: host_port:container_port
  ports {
    internal = 80
    external = 8082 # Access the container via http://localhost:8080
  }

  # Set the container to restart automatically
  restart = "always"
  
  # Ensure the container waits for the image to be ready
  depends_on = [docker_image.nginx_image] 
}

# --- Output the accessible URL ---
output "web_server_url" {
  description = "The URL to access the Nginx web server"
  value       = "http://localhost:${docker_container.web_container.ports[0].external}"
}
