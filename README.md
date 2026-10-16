# Kube-Agents Infrastructure Fleet & GitOps Root (`kube-agents-infra`)

Authoritative GitOps infrastructure root and platform management hub for the Kubernetes Agentic fleet across Google Cloud projects **`gca-gke-test`** (25 clusters) and **`gca-gke-2025`** (2 clusters).

---

## 1. Directory Structure

```text
kube-agents-infra/
├── argocd/
│   ├── applications/                     # Declarative fleet Application CRs
│   │   ├── fleet-infrastructure.yaml     # Base infra & network policies
│   │   ├── fleet-terraform-automation.yaml # Automated Terraform reconciliation
│   │   ├── fleet-iam-rbac.yaml           # Syncs fkc1e100/kube-agents-iam
│   │   └── fleet-applications.yaml       # Syncs fkc1e100/kube-agents-apps
│   └── root-application.yaml             # App-of-Apps root controller
├── manifests/
│   └── infra/
│       ├── default-allow-dns.yaml        # Fleet-wide DNS network policy
│       └── terraform-runner/             # Workload Identity runner & sync-hook job
└── terraform/
    ├── modules/
    │   ├── gke-autopilot-cluster/        # Autopilot cluster module
    │   ├── gke-standard-cluster/         # Standard cluster module with GPU/TPU accelerators
    │   └── vpc-network/                  # VPC and subnet provisioning module
    └── environments/
        ├── gca-gke-test/                 # 25 dedicated cluster directories + networks
        │   ├── README.md                 # Per-cluster hardware index & operational runbook
        │   ├── networks/                 # Custom VPCs (A2, A3, Cursor, TPU)
        │   ├── ka-webconsole-pr2321/     # Autopilot management & console cluster
        │   ├── kcc-management-cluster/   # Autopilot Argo CD GitOps management cluster
        │   ├── gke-a2-highgpu/           # Standard 8x A100 40GB accelerator cluster
        │   ├── gke-a2-ultra/             # Standard 8x A100 80GB + bench cluster
        │   ├── gke-a3-mega/              # Standard 8x H100 Mega accelerator cluster
        │   ├── gke-cursor/               # Standard 8x H200 141GB accelerator cluster
        │   ├── gke-tpuv6-dws/            # Standard Cloud TPU v6e Trillium cluster
        │   └── ... (25 clusters total)   # Standalone root per cluster
        └── gca-gke-2025/                 # 2 dedicated cluster directories + networks
            ├── README.md                 # Hardware index & operational runbook
            ├── networks/                 # gemma4-inference-vpc
            ├── kcc-gitops-hub/           # GitOps & KCC controller hub cluster
            └── openrl-gpu-hub/           # Standard 3x NVIDIA L4 GPU accelerator cluster
```

---

## 2. Fleet Inventory & Hardware Topologies

### Google Cloud Project: `gca-gke-test` (25 Clusters)

| Cluster Name | Location | Mode | Hardware / Accelerators | Network |
| :--- | :--- | :--- | :--- | :--- |
| **`ka-webconsole-pr2321`** | `us-central1` | Autopilot | GKE Managed | `default` |
| **`kcc-management-cluster`** | `us-central1` | Autopilot | GKE Managed (Argo CD Hub) | `default` |
| **`gke-a2-highgpu`** | `us-central1` | Standard | 8x NVIDIA A100 40GB (`a2-highgpu-8g`) | `gke-a2-highgpu-net` |
| **`gke-a2-ultra`** | `us-central1` | Standard | 8x NVIDIA A100 80GB (`a2-ultragpu-8g`), 4x A100 (`bench-gpu`) | `gke-a2-ultra-net` |
| **`gke-a3-mega`** | `us-central1` | Standard | 8x NVIDIA H100 Mega 80GB (`a3-megagpu-8g`) | `gke-a3-mega-net` |
| **`gke-cursor`** | `us-central1` | Standard | 8x NVIDIA H200 141GB (`a3-ultragpu-8g`) | `gke-cursor-net` |
| **`gke-tpuv6-dws`** | `us-west4` | Standard | Google Cloud TPU v6e Trillium (`ct5lp-hightpu-4t`) | `slm-training-net` |
| **`dataproc-billing-test-cluster`** | `us-central1-a` | Standard | `e2-standard-4` | `default` |
| **`kcc-addon-test-cluster`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`openrl-chaos-sandbox`** | `us-central1-a` | Standard | `e2-standard-8` | `default` |
| **`simple-app-cluster`** | `us-central1` | Standard | `e2-medium` | `default` |
| **`containercluster-6lgctkbp5dciv7y`**| `us-west2` | Standard | `e2-medium` | `default` |
| **`prod-analytics-store-15`** | `asia-east1-b` | Standard | `e2-standard-2` | `default` |
| **`prod-analytics-store-15`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`hpc-batch-compute-17`** | `asia-southeast1-b` | Standard | `e2-standard-2` | `default` |
| **`hpc-batch-compute-17`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`prod-catalog-sync-13`** | `europe-west1-c` | Standard | `e2-standard-2` | `default` |
| **`prod-catalog-sync-13`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`prod-ha-payments-14`** | `europe-west3-b` | Standard | `e2-standard-2` | `default` |
| **`prod-ha-payments-14`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`prod-api-router-07`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`prod-api-router-07`** | `us-east1-c` | Standard | `e2-standard-2` | `default` |
| **`prod-auto-scaler-10`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |
| **`prod-auto-scaler-10`** | `us-west1-b` | Standard | `e2-standard-2` | `default` |
| **`edge-ingress-gateway-06`** | `us-central1-a` | Standard | `e2-standard-2` | `default` |

### Google Cloud Project: `gca-gke-2025` (2 Clusters)

| Cluster Name | Location | Mode | Hardware / Accelerators | Network |
| :--- | :--- | :--- | :--- | :--- |
| **`kcc-gitops-hub`** | `us-east1-c` | Standard | `e2-standard-4` | `default` |
| **`openrl-gpu-hub`** | `us-east1-c` | Standard | 3x NVIDIA L4 (`g2-standard-16`) | `gemma4-inference-vpc` |

---

## 3. GitOps PR-to-Argo CD Reconciliation Workflow

When `kube-agents` needs to adjust cluster capacity, add a node pool, configure an accelerator, or resolve an infrastructure defect:

1. **Pull Request Workflow:**
   - Kube-agents creates an isolated branch, modifies the relevant Terraform module or environment (`terraform/environments/gca-gke-test/` or `terraform/environments/gca-gke-2025/`), and submits a PR to `fkc1e100/kube-agents-infra`.
2. **Review & Merge:**
   - Automated presubmits validate syntax via `terraform fmt -check` and `terraform validate`.
3. **Argo CD Automated Sync:**
   - Argo CD on `kcc-management-cluster` (`argocd/applications/fleet-terraform-automation.yaml`) detects the commit on `main`.
   - The `Job/fleet-terraform-reconciler` runs under Workload Identity using `fleet-terraform-runner` service account.
   - Terraform applies the change directly to the target GCP environment without manual intervention.
