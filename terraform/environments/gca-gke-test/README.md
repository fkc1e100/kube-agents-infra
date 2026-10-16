# GKE Clusters in `gca-gke-test`

Every cluster in `gca-gke-test` has its own dedicated directory with an independent Terraform root (`main.tf`, `variables.tf`, `outputs.tf`), isolated state, and discrete blast radius.

---

## Directory Index

```text
gca-gke-test/
├── networks/                             # Custom VPC networks for GPU & TPU clusters
├── ka-webconsole-pr2321/                 # Web Console, Scion Chat UI, and public proxy
├── kcc-management-cluster/               # Argo CD GitOps Hub & Config Connector manager
├── gke-a2-highgpu/                       # 8x NVIDIA A100 (40GB) training & inference
├── gke-a2-ultra/                         # 8x NVIDIA A100 (80GB) + 4x A100 benchmarking
├── gke-a3-mega/                          # 8x NVIDIA H100 Mega (80GB) distributed LLM
├── gke-cursor/                           # 8x NVIDIA H200 (141GB) ultra-accelerator
├── gke-tpuv6-dws/                        # Cloud TPU v6e Trillium Dynamic Workload Scheduler
├── dataproc-billing-test-cluster/        # Dataproc & BigQuery billing integration
├── kcc-addon-test-cluster/               # KCC Add-on deprecation & migration testing
├── openrl-chaos-sandbox/                 # OpenRL reinforcement learning chaos sandbox
├── simple-app-cluster/                   # Sample multi-tenant demo cluster
├── containercluster-6lgctkbp5dciv7y/     # Regional disaster recovery & failover test
├── edge-ingress-gateway-06/              # Global perimeter ingress gateway & routing
├── prod-analytics-store-15-asia-east1/   # Analytics Store - APAC East Replica
├── prod-analytics-store-15-us-central1/  # Analytics Store - Primary US Central Store
├── hpc-batch-compute-17-asia-se1/        # HPC Batch Compute - Southeast Asia Pool
├── hpc-batch-compute-17-us-central1/     # HPC Batch Compute - US Central Pool
├── prod-catalog-sync-13-europe-west1/    # Catalog Sync - EMEA West
├── prod-catalog-sync-13-us-central1/     # Catalog Sync - US Central
├── prod-ha-payments-14-europe-west3/     # HA Payments Gateway - Frankfurt
├── prod-ha-payments-14-us-central1/      # HA Payments Gateway - US Central
├── prod-api-router-07-us-central1/       # Edge API Router - Central Region
├── prod-api-router-07-us-east1/          # Edge API Router - East Region
├── prod-auto-scaler-10-us-central1/      # Workload Autoscaler - Central Region
└── prod-auto-scaler-10-us-west1/         # Workload Autoscaler - West Region
```

---

## Cluster Hardware & Network Profiles

| Directory | Mode | Location | Hardware / Accelerators | Network |
| :--- | :--- | :--- | :--- | :--- |
| **[`ka-webconsole-pr2321/`](./ka-webconsole-pr2321)** | Autopilot | `us-central1` | GKE Managed | `default` |
| **[`kcc-management-cluster/`](./kcc-management-cluster)** | Autopilot | `us-central1` | GKE Managed | `default` |
| **[`gke-a2-highgpu/`](./gke-a2-highgpu)** | Standard | `us-central1` | 8x NVIDIA A100 40GB (`a2-highgpu-8g`) | `gke-a2-highgpu-net` |
| **[`gke-a2-ultra/`](./gke-a2-ultra)** | Standard | `us-central1` | 8x NVIDIA A100 80GB (`a2-ultragpu-8g`), 4x A100 (`bench-gpu`) | `gke-a2-ultra-net` |
| **[`gke-a3-mega/`](./gke-a3-mega)** | Standard | `us-central1` | 8x NVIDIA H100 Mega 80GB (`a3-megagpu-8g`) | `gke-a3-mega-net` |
| **[`gke-cursor/`](./gke-cursor)** | Standard | `us-central1` | 8x NVIDIA H200 141GB (`a3-ultragpu-8g`) | `gke-cursor-net` |
| **[`gke-tpuv6-dws/`](./gke-tpuv6-dws)** | Standard | `us-west4` | Cloud TPU v6e Trillium (`ct5lp-hightpu-4t`) | `slm-training-net` |
| **[`dataproc-billing-test-cluster/`](./dataproc-billing-test-cluster)** | Standard | `us-central1-a` | `e2-standard-4` | `default` |
| **[`kcc-addon-test-cluster/`](./kcc-addon-test-cluster)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`openrl-chaos-sandbox/`](./openrl-chaos-sandbox)** | Standard | `us-central1-a` | `e2-standard-8` | `default` |
| **[`simple-app-cluster/`](./simple-app-cluster)** | Standard | `us-central1` | `e2-medium` | `default` |
| **[`containercluster-6lgctkbp5dciv7y/`](./containercluster-6lgctkbp5dciv7y)** | Standard | `us-west2` | `e2-medium` | `default` |
| **[`edge-ingress-gateway-06/`](./edge-ingress-gateway-06)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`prod-analytics-store-15-asia-east1/`](./prod-analytics-store-15-asia-east1)** | Standard | `asia-east1-b` | `e2-standard-2` | `default` |
| **[`prod-analytics-store-15-us-central1/`](./prod-analytics-store-15-us-central1)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`hpc-batch-compute-17-asia-se1/`](./hpc-batch-compute-17-asia-se1)** | Standard | `asia-southeast1-b` | `e2-standard-2` | `default` |
| **[`hpc-batch-compute-17-us-central1/`](./hpc-batch-compute-17-us-central1)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`prod-catalog-sync-13-europe-west1/`](./prod-catalog-sync-13-europe-west1)** | Standard | `europe-west1-c` | `e2-standard-2` | `default` |
| **[`prod-catalog-sync-13-us-central1/`](./prod-catalog-sync-13-us-central1)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`prod-ha-payments-14-europe-west3/`](./prod-ha-payments-14-europe-west3)** | Standard | `europe-west3-b` | `e2-standard-2` | `default` |
| **[`prod-ha-payments-14-us-central1/`](./prod-ha-payments-14-us-central1)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`prod-api-router-07-us-central1/`](./prod-api-router-07-us-central1)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`prod-api-router-07-us-east1/`](./prod-api-router-07-us-east1)** | Standard | `us-east1-c` | `e2-standard-2` | `default` |
| **[`prod-auto-scaler-10-us-central1/`](./prod-auto-scaler-10-us-central1)** | Standard | `us-central1-a` | `e2-standard-2` | `default` |
| **[`prod-auto-scaler-10-us-west1/`](./prod-auto-scaler-10-us-west1)** | Standard | `us-west1-b` | `e2-standard-2` | `default` |

---

## Operating on an Individual Cluster

To plan or apply changes to a single cluster without touching the rest of the fleet:

```bash
cd terraform/environments/gca-gke-test/<cluster-folder>
terraform init
terraform plan
terraform apply
```
