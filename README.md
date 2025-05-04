# 🛡️ DDoS Monitoring Lab  
### Load Testing + Real-Time Monitoring with Kubernetes, Prometheus & Grafana

Simulate a controlled, high-concurrency load using `wrk` inside a Kubernetes cluster, while monitoring the system using Prometheus and Grafana — all locally, via Minikube.

<p align="center">
  <img src="docs/architecture.png" width="600" alt="Project Architecture">
</p>

---

## 🚀 Features

- ✅ Lightweight Minikube-based Kubernetes environment
- 🔁 DDoS-like load simulation via Kubernetes Job (`wrk`)
- 📦 Prometheus & Grafana deployed using Helm
- 📊 Custom Grafana dashboard for real-time visualization
- ⚙️ PowerShell scripts for full automation
- 🧪 GitHub Actions CI for YAML validation

---

## 🧰 Requirements

| Tool        | Version      |
|-------------|--------------|
| Docker      | latest       |
| Minikube    | latest       |
| kubectl     | latest       |
| Helm        | latest       |
| PowerShell  | Windows only |

---

## 📦 Installation

1. **Clone the repo:**

```bash
git clone https://github.com/edo-sharon/ddos-monitoring-lab.git
cd ddos-monitoring-lab
```

2. **Run setup script (Windows):**

```powershell
.\automation\install.ps1
```

This script will:
- Launch Minikube with Docker
- Deploy Prometheus and Grafana using Helm
- Launch the `wrk` load test job
- Forward Grafana to `http://localhost:3000`

---

## 📊 Grafana Dashboard

- Visit [http://localhost:3000](http://localhost:3000)
- Default credentials:  
  **user:** `admin`  
  **password:** (get via command below)

```powershell
kubectl -n monitoring get secret prometheus-grafana -o jsonpath="{.data.admin-password}" | powershell -Command "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String((Get-Content -Raw)))"
```

- Import dashboard:  
  `dashboards/wrk-performance.json`

---

## 🧪 GitHub Actions

All YAML files are validated automatically on every push or pull request using [`yamllint`](https://github.com/adrienverge/yamllint).

🟢 Status: ![CI](https://github.com/edo-sharon/ddos-monitoring-lab/actions/workflows/validate.yaml/badge.svg)

---

## 📁 Project Structure

```
ddos-monitoring-lab/
├── wrk-job.yaml
├── automation/
│   ├── install.ps1
│   └── verify.ps1
├── monitoring/
│   └── values.yaml
├── dashboards/
│   └── wrk-performance.json
├── docs/
│   └── architecture.png
├── .github/workflows/
│   └── validate.yaml
├── .yamllint.yml
├── .gitignore
└── README.md
```

---

## 📄 License

MIT © 2025 Edo Sharon
