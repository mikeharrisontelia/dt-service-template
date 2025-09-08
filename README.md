# Service Template

This is a template repository for creating new microservices with standardized:

- **CI/CD Pipeline** - Automated build and deployment to Kubernetes
- **JFrog Integration** - Container registry and dependency management
- **Kubernetes Deployment** - Production-ready manifests with security best practices
- **Python FastMCP Framework** - MCP server foundation

## Quick Start

1. **Use this template** to create a new repository
2. **Replace template variables** in the following files:
   - Update `SERVICE_NAME` throughout all files
   - Update `NAMESPACE` in k8s manifests
   - Update `REGISTRY_PATH` in CI/CD and k8s files
   - Update service-specific configuration in `k8s/configmap.yaml`
3. **Configure secrets** in GitHub repository settings:
   - `ARTIFACTORY_USERNAME`
   - `ARTIFACTORY_PASSWORD`
   - `KUBE_CONFIG`
   - `AZURE_CLIENT_ID`
   - `AZURE_CLIENT_SECRET`
   - `POSTGRES_PASSWORD`
4. **Customize application code** in the `app/` directory
5. **Update dependencies** in `requirements.txt`

## Template Variables to Replace

| Variable | Description | Example |
|----------|-------------|---------|
| `{{SERVICE_NAME}}` | Your service name | `dt-my-service` |
| `{{NAMESPACE}}` | Kubernetes namespace | `my-namespace` |
| `{{REGISTRY_PATH}}` | JFrog registry path | `tools-github-myteam.jfrog.teliacompany.io` |
| `{{SERVICE_PORT}}` | Application port | `8000` |
| `{{INGRESS_HOST}}` | External hostname | `my-service.backstage.teliacompany.net` |

## Repository Structure

```
├── .github/
│   └── workflows/
│       └── deploy.yml          # CI/CD pipeline
├── app/                        # Application code directory
│   ├── main.py                # Main application entry point
│   └── __init__.py            # Python package marker
├── k8s/                       # Kubernetes manifests
│   ├── configmap.yaml         # Configuration
│   ├── deployment.yaml        # Deployment spec
│   ├── service.yaml           # Service definition
│   └── ingress.yaml           # Ingress configuration
├── Dockerfile                 # Container build definition
├── requirements.txt           # Python dependencies
├── .dockerignore             # Docker build exclusions
├── .gitignore                # Git exclusions
└── README.md                 # This file
```

## Features

- **🔄 Automated CI/CD** - Push to main triggers build and deploy
- **🐳 Docker Build** - Multi-stage build with security hardening
- **☸️ Kubernetes Ready** - Production-ready manifests with RBAC
- **🔐 Security First** - Non-root containers, read-only filesystem
- **📊 Monitoring Ready** - Health checks and resource limits
- **🌐 Network Proxy** - Telia corporate proxy configuration
- **🔑 Secret Management** - Kubernetes secrets integration

## Customization Guide

### 1. Service Name and Paths
Search and replace `{{SERVICE_NAME}}` with your actual service name in:
- `.github/workflows/deploy.yml`
- `k8s/deployment.yaml`
- `k8s/service.yaml`
- `k8s/ingress.yaml`
- `k8s/configmap.yaml`

### 2. Namespace Configuration
Update `{{NAMESPACE}}` in all k8s manifests to your target namespace.

### 3. Registry Configuration
Update `{{REGISTRY_PATH}}` in:
- `.github/workflows/deploy.yml`
- `k8s/deployment.yaml`

### 4. Application Code
Replace the template application in `app/` with your actual service code.

### 5. Dependencies
Update `requirements.txt` with your specific Python package requirements.

## Deployment

The service automatically deploys to Kubernetes when code is pushed to the `main` branch.

Manual deployment can be triggered via GitHub Actions workflow dispatch.

## Support

For questions or issues with this template, please contact the DevSecOps Services Team.