# DDoS Monitoring Lab with Kubernetes, Prometheus & Grafana

This project simulates a lightweight DDoS-like load test in a local Kubernetes cluster using `wrk`, with real-time monitoring using Prometheus and Grafana.

##  What’s Included

- `Minikube`-based Kubernetes environment
- Load testing with `wrk` via Kubernetes Job
- Prometheus and Grafana monitoring stack (via Helm)
- Custom Grafana dashboards
- PowerShell automation scripts

##  How to Run

1. Install Docker & Minikube (Windows)
2. Run the PowerShell installer:
   ```powershell
   ./automation/install.ps1
