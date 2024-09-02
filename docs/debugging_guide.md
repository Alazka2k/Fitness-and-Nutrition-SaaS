# Debugging Guide for Containerized Environment

This guide provides steps and commands for debugging issues in the Docker and Kubernetes environment of the Fitness SaaS project.

## Docker Debugging

### 1. Check Docker Image

Verify the Docker image exists and has the correct tag:

```
docker images | findstr user-service
```

### 2. Test Docker Container Locally

Run the Docker container locally to isolate issues:

```
docker run -p 8000:8000 alazka/user-service:latest
```

### 3. Check Docker Logs

View logs of a running Docker container:

```
docker logs <container_id>
```

### 4. Inspect Docker Container

Get detailed information about a container:

```
docker inspect <container_id>
```

### 5. Execute Commands in Running Container

Access a shell in the running container:

```
docker exec -it <container_id> /bin/bash
```

## Kubernetes Debugging

### 1. Check Pod Status

View the status of all pods:

```
kubectl get pods
```

### 2. Describe Pod

Get detailed information about a specific pod:

```
kubectl describe pod <pod_name>
```

### 3. View Pod Logs

Check the logs of a specific pod:

```
kubectl logs <pod_name>
```

For previous instance of a pod:

```
kubectl logs <pod_name> --previous
```

### 4. Execute Commands in Pod

Run a command in a running pod:

```
kubectl exec -it <pod_name> -- /bin/bash
```

### 5. Check Service

Verify the service is correctly configured:

```
kubectl get service user-service
kubectl describe service user-service
```

### 6. Check Deployments

View the status of deployments:

```
kubectl get deployments
kubectl describe deployment user-service
```

### 7. Check Events

View cluster events for troubleshooting:

```
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Common Issues and Solutions

### 1. ImagePullBackOff Error

If you see this error, check:

- Image name and tag are correct in your deployment YAML
- Image exists in the specified repository
- Kubernetes has the necessary credentials to pull the image

Solution:

```
kubectl set image deployment/user-service user-service=alazka/user-service:latest
```

### 2. CrashLoopBackOff Error

This usually means the application is crashing. Check the logs:

```
kubectl logs <pod_name>
```

### 3. Pending Status

If a pod is stuck in Pending status, check for resource constraints:

```
kubectl describe pod <pod_name>
```

Look for events indicating insufficient CPU, memory, or other resources.

### 4. Service Not Accessible

If you can't access your service, verify:

- The service is running: `kubectl get services`
- Endpoints are created: `kubectl get endpoints user-service`
- Port forwarding works: `kubectl port-forward service/user-service 8000:8000`

### 5. Liveness/Readiness Probe Failure

Check the probe configuration in your deployment YAML and ensure the health check endpoint is working correctly.

Remember to always check application logs, Kubernetes events, and pod descriptions when troubleshooting issues. If problems persist, review your Dockerfile, Kubernetes YAML files, and application code for potential misconfigurations.
