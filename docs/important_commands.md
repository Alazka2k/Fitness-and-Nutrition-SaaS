# Important Commands for Fitness SaaS Project

This document outlines key commands for managing the development workflow of the Fitness SaaS project.

## Application Management

### Run the application

#### Local Development

Start your FastAPI application with hot-reloading enabled (for local development):

```
poetry run uvicorn src.main:app --reload
```

#### Docker Environment

To run the application in a Docker environment:

1. Build the Docker image (if not already built):

   ```
   docker build -t alazka/user-service:latest .
   ```

2. Run the Docker container:

   ```
   docker run -p 8000:8000 alazka/user-service:latest
   ```

3. For development with Minikube, first set the Docker environment:

   ```
   & minikube -p minikube docker-env --shell powershell | Invoke-Expression
   ```

   Then build and run as above.

4. To access the service when running in Minikube:
   ```
   kubectl port-forward service/user-service 8000:8000
   ```

### Updating the Application

After making changes to your code, follow these steps to update the running application:

#### Local Development

If you're running the application locally with hot-reloading enabled, changes will be applied automatically when you save your files.

#### Docker Environment

1. Rebuild the Docker image with the new changes:

   ```
   docker build -t alazka/user-service:latest .
   ```

2. If using Minikube, ensure you're using its Docker daemon:

   ```
   & minikube -p minikube docker-env --shell powershell | Invoke-Expression
   ```

3. Push the updated image to your registry (if not using Minikube):
   ```
   docker push alazka/user-service:latest
   ```

#### Kubernetes/Helm

1. If you've made changes to the Helm chart:

   ```
   helm upgrade user-service ./user-service
   ```

2. If you've only updated the Docker image:

   ```
   kubectl rollout restart deployment user-service
   ```

3. Monitor the rollout:

   ```
   kubectl rollout status deployment user-service
   ```

4. Verify the new pod is running with the updated image:
   ```
   kubectl get pods
   kubectl describe pod <new-pod-name>
   ```

## Testing

### Run tests

Execute the test suite using either of these commands:

```
poetry run build test
```

or

```
poetry run pytest
```

## Dependency Management

### Install dependencies

Install or update project dependencies:

```
poetry run build setup
```

or

```
poetry install
```

### Add new dependencies

Add new packages to your project:

```
poetry add <package-name>
```

### Update dependencies

Update project dependencies to their latest versions within the constraints specified in pyproject.toml:

```
poetry update
```

## Code Quality

### Lint code

Check your code for style issues and potential errors using Black, isort, and mypy:

```
poetry run build lint
```

### Format code

Automatically format your code to adhere to the project's style guidelines:

```
poetry run build format
```

## Environment Management

### Activate virtual environment

Activate the project's virtual environment:

```
poetry shell
```

## Build Tasks

### Show help for build tasks

Display available tasks in your Build.ps1 script:

```
poetry run build
```

or

```
poetry run build help
```

## File Management

### Create a new Python file (PowerShell command)

Create a new Python file in the src directory:

```
New-Item -Path .\src -Name "new_module.py" -ItemType "file"
```

Remember to run these commands from the project root directory. Keep this document updated as new commands are added or existing ones are modified.
