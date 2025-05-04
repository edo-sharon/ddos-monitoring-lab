# PowerShell install script for Windows

Write-Host "🚀 Starting setup..."

# Step 1: Start Minikube
Write-Host "▶ Starting Minikube..."
minikube start --driver=docker

# Step 2: Add Helm repo
Write-Host "▶ Adding Prometheus Helm repo..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Step 3: Create namespace
Write-Host "▶ Creating namespace 'monitoring'..."
kubectl create namespace monitoring

# Step 4: Install Prometheus + Grafana
Write-Host "▶ Installing Prometheus stack..."
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring

# Step 5: Port-forward Grafana
Write-Host "▶ Port-forwarding Grafana (http://localhost:3000)..."
Start-Process powershell -ArgumentList "kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80"

# Step 6: Done
Write-Host "✅ Setup complete! Open http://localhost:3000 (admin / prom-operator)"
