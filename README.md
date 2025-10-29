# 🚀 DevOps Internship - Task 4: IaC with Terraform and Docker
## Project Objective
This project demonstrates the core principles of **Infrastructure as Code (IaC)** by using **HashiCorp Terraform** to provision and manage a simple Docker container locally. The goal is to automate the deployment lifecycle (init, plan, apply, destroy) of a containerized application.
---
## 🛠️ Prerequisites
Before starting, ensure you have the following tools installed and configured:
1.  **Docker Engine:** Must be installed and running on your machine (used to host the container).
2.  **Terraform CLI:** Must be installed (used to define and execute the infrastructure code).
---
## 📁 Project Structure
The root directory contains the essential Terraform configuration file:
### `main.tf` Description
The `main.tf` file defines two primary resources using the **Docker Provider**:
1.  **`docker_image`**: Pulls the `hello-world:latest` image from Docker Hub.
2.  **`docker_container`**: Creates and runs a container named `terraform-hello-container` using the pulled image.
---
## 🏃 Getting Started (Execution Guide)
Follow these steps in your terminal from the directory containing `main.tf` to provision the infrastructure.
### Step 1: Initialize the Working Directory
This command downloads the **Docker Provider** and sets up the necessary local files.
```bash
terraform init
terraform plan
docker ps -a | grep terraform-hello-container
terraform state list
terraform destroy
<img width="1919" height="1079" alt="Screenshot 2025-10-29 200739" src="https://github.com/user-attachments/assets/6275ca1f-1d18-42b1-bb4e-ec391ad4aaa0" />
<img width="1410" height="1079" alt="Screenshot 2025-10-29 200717" src="https://github.com/user-attachments/assets/8692fa28-b086-4f85-b714-c40159b7f944" />
<img width="1919" height="1079" alt="Screenshot 2025-10-29 200634" src="https://github.com/user-attachments/assets/5e3ee089-f587-4341-a113-5581922757d3" />
