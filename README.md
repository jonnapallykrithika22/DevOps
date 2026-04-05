- **Blue Environment**: Current production version
- **Green Environment**: New version ready for deployment
- **Service**: Routes traffic based on label selector
- **Zero Downtime**: Instant switching with no dropped requests

 🚀 Features

- ✅ **Zero-downtime deployments** - Switch traffic instantly
- ✅ **Instant rollback** - Revert to previous version in seconds
- ✅ **Health checks** - Automated validation before switching
- ✅ **Containerized** - Docker images for portability
- ✅ **Kubernetes-native** - Uses standard K8s resources
- ✅ **Automated scripts** - Smart switching with health validation

 🛠️ Tech Stack

- **Application**: Go (Gin framework)
- **Containerization**: Docker
- **Orchestration**: Kubernetes (Minikube for local development)
- **Container Registry**: Docker Hub
- **Scripting**: Bash

 📁 Project Structure
.
├── main.go                  # Go application with health endpoints
├── Dockerfile              # Multi-stage Docker build
├── blue-deployment.yaml    # Blue environment deployment
├── green-deployment.yaml   # Green environment deployment
├── service.yaml           # Kubernetes service (traffic router)
├── ingress.yaml           # Ingress configuration
├── smart-switch.sh        # Automated switching with health checks
├── test-blue-green.sh     # Continuous testing script
└── rollback-to-blue.sh    # Emergency rollback script

 🎮 Quick Start

 Prerequisites

- Docker Desktop
- Kubernetes (Minikube)
- kubectl CLI
- Go 1.21+

 Setup

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/blue-green-kubernetes-deployment.git
cd blue-green-kubernetes-deployment
```

2. **Start Minikube**
```bash
minikube start --driver=docker --cpus=2 --memory=4096
```

3. **Deploy Blue and Green environments**
```bash
kubectl apply -f blue-deployment.yaml
kubectl apply -f green-deployment.yaml
kubectl apply -f service.yaml
```

4. **Verify deployments**
```bash
kubectl get pods
```

5. **Port-forward to access the service**
```bash
kubectl port-forward service/blue-green-service 8081:80
```

6. **Test in another terminal**
```bash
curl http://localhost:8081/
```

 🔄 Usage

 Switch to Green Environment (Zero Downtime)
```bash
./smart-switch.sh green
```

 Rollback to Blue
```bash
./smart-switch.sh blue
```

 Continuous Testing

Monitor traffic switching in real-time:
```bash
./test-blue-green.sh
```

 🧪 Testing

The project includes automated health checks:

- **Liveness Probe**: `/health` endpoint
- **Readiness Probe**: Ensures pods are ready before receiving traffic
- **Health Validation**: Scripts verify deployment health before switching

 📊 Endpoints

- `GET /` - Main application endpoint
- `GET /health` - Health check endpoint
- `GET /version` - Returns current version (blue/green)

 🎯 Key Learnings

1. **Blue/Green Deployment Pattern** - Zero-downtime deployment strategy
2. **Kubernetes Service Selectors** - Dynamic traffic routing
3. **Container Orchestration** - Managing multiple environments
4. **Health Checks** - Ensuring reliability before switching
5. **Docker Multi-stage Builds** - Optimized container images

 📈 What I Built

- Go REST API with health check endpoints
- Docker containerization with multi-stage builds
- Kubernetes deployments with resource limits
- Automated switching scripts with health validation
- Zero-downtime traffic switching mechanism

 🔮 Future Enhancements

- [ ] Canary deployment (gradual traffic shift)
- [ ] CI/CD pipeline with GitHub Actions
- [ ] Prometheus & Grafana monitoring
- [ ] Database integration with migration handling
- [ ] Deployment to AWS EKS

 📝 License

MIT License - feel free to use this project for learning!

