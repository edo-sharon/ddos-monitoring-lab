Write-Host "🔍 Verifying DDoS Monitoring Lab setup..."

# Step 1: Check Minikube status
$minikubeStatus = minikube status
if ($minikubeStatus -notmatch "Running") {
    Write-Host "❌ Minikube is not running." -ForegroundColor Red
    exit 1
} else {
    Write-Host "✅ Minikube is running." -ForegroundColor Green
}

# Step 2: Check Prometheus pods
$promPods = kubectl get pods -n monitoring
if ($promPods -notmatch "prometheus") {
    Write-Host "❌ Prometheus pods not found." -ForegroundColor Red
    exit 1
} else {
    Write-Host "✅ Prometheus pods found." -ForegroundColor Green
}

# Step 3: Check Grafana port-forward
$grafanaPort = Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue
if ($grafanaPort) {
    Write-Host "✅ Grafana is accessible on http://localhost:3000" -ForegroundColor Green
} else {
    Write-Host "❌ Grafana is not port-forwarded." -ForegroundColor Yellow
    Write-Host "   Try running: kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80"
}

# Step 4: Test Grafana access
try {
    $response = Invoke-WebRequest http://localhost:3000 -UseBasicParsing -TimeoutSec 5
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Grafana responded successfully." -ForegroundColor Green
    } else {
        Write-Host "❌ Grafana did not respond as expected." -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Failed to connect to Grafana." -ForegroundColor Red
}

Write-Host "`n🎯 Verification complete."
