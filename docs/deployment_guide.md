# Deployment Guide for Fitness SaaS Project

This guide outlines the steps to deploy the Fitness SaaS application using Docker and Kubernetes (Minikube).

## Prerequisites

- Docker installed and configured
- Minikube installed
- Helm installed
- kubectl installed

## Step 1: Build and Push Docker Image

1. Navigate to the project root directory:

   ```
   cd /path/to/Fitness-and-Nutrition-SaaS
   ```

2. Build the Docker image:

   ```
   docker build -t alazka/user-service:latest .
   ```

3. Push the image to Docker Hub (ensure you're logged in):
   ```
   docker push alazka/user-service:latest
   ```

## Step 2: Start Minikube

1. Start Minikube:

   ```
   minikube start
   ```

2. Set Docker to use Minikube's Docker daemon:
   ```
   & minikube -p minikube docker-env --shell powershell | Invoke-Expression
   ```

## Step 3: Deploy the Application using Helm

1. Navigate to the directory containing your Helm chart:

   ```
   cd /path/to/Fitness-and-Nutrition-SaaS/helm-chart
   ```

2. Install or upgrade the Helm release:
   ```
   helm upgrade --install user-service ./user-service
   ```

## Step 4: Verify Deployment

1. Check the status of the pods:

   ```
   kubectl get pods
   ```

2. Ensure the pod is in a 'Running' state.

3. Check the deployment status:

   ```
   kubectl get deployment user-service
   ```

4. Verify the service:
   ```
   kubectl get service user-service
   ```

## Step 5: Access the Service

To access the service locally:

1. Set up port-forwarding:

   ```
   kubectl port-forward service/user-service 8000:8000
   ```

2. In a new terminal, test the service:
   ```
   curl http://localhost:8000
   curl http://localhost:8000/health
   ```
