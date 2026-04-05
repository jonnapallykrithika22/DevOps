# Blue/Green Deployment Project

## What I Built
- Go application with health checks
- Docker containers (blue & green versions)
- Kubernetes deployments on Minikube
- Zero-downtime traffic switching
- Automated rollback scripts

## Key Learnings
1. Blue/Green deployment eliminates downtime
2. Kubernetes Services route traffic using selectors
3. Health checks ensure reliability
4. Docker makes applications portable
5. Kubernetes manages container orchestration

## Commands I Learned
- `kubectl get pods` - Check running containers
- `kubectl apply -f file.yaml` - Deploy resources
- `kubectl patch service` - Update service configuration
- `docker build/push` - Create and publish images
- `minikube start/stop` - Manage local cluster

## What's Next
- [ ] Add canary deployment
- [ ] Implement CI/CD pipeline
- [ ] Add monitoring with Prometheus
- [ ] Deploy to AWS EKS
- [ ] Add database layer
