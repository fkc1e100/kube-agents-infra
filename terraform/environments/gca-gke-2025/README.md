# GKE Environment: `gca-gke-2025`

This directory manages the GKE clusters and networking in Google Cloud project `gca-gke-2025`.

## Directory Structure

Every cluster and shared networking component has its own isolated, self-contained Terraform root configuration with dedicated state isolation.

```text
terraform/environments/gca-gke-2025/
├── networks/           # VPC network ('gemma4-inference-vpc') and subnets
├── kcc-gitops-hub/     # GKE Standard cluster in us-east1-c (Config Connector / GitOps hub)
└── openrl-gpu-hub/     # GKE Standard cluster in us-east1-c (3x NVIDIA L4 GPUs for RL fine-tuning)
```

## Hardware Profiles

| Directory | Cluster Name | Type | Location | Hardware / Nodes | Purpose |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `kcc-gitops-hub/` | `kcc-gitops-hub` | Standard | `us-east1-c` | 2x `e2-standard-4` | GitOps and KCC resource controller hub |
| `openrl-gpu-hub/` | `openrl-gpu-hub` | Standard | `us-east1-c` | 3x `g2-standard-8` (3x NVIDIA L4 24GB GPUs) | OpenRL distributed reinforcement learning & Gemma 4 inference |

## Operational Commands

Each cluster can be planned and applied independently without risk of cross-cluster blast radius:

```bash
cd terraform/environments/gca-gke-2025/<cluster-folder>
terraform init
terraform plan
terraform apply
```
