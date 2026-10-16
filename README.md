# Kube-Agents Infrastructure Fleet & GitOps Root (`kube-agents-infra`)

This repository serves as the authoritative GitOps infrastructure root and platform management hub for the Kubernetes Agentic fleet across Google Cloud project `gca-gke-test`.

---

## 1. Directory Structure

```text
kube-agents-infra/
├── argocd/
│   ├── applications/                 # Declarative fleet Application CRs
│   │   ├── fleet-infrastructure.yaml # Infra & platform manifests
│   │   ├── fleet-iam-rbac.yaml       # Syncs fkc1e100/kube-agents-iam
│   │   └── fleet-applications.yaml   # Syncs fkc1e100/kube-agents-apps
│   └── root-application.yaml         # App-of-Apps root controller
├── clusters/                         # Cluster inventory & topology definitions
├── manifests/
│   └── infra/                        # Cluster-wide network policies, CRDs, gatekeeper
└── terraform/
    ├── environments/
    │   └── gca-gke-test/             # Fleet provisioning configurations
    └── modules/
        ├── gke-autopilot/            # Autopilot cluster module
        ├── gke-cluster/              # Standard cluster module
        └── vpc-network/              # Shared VPC & subnet module
```

---

## 2. GitOps App-of-Apps Architecture

Argo CD runs on `kcc-management-cluster` in namespace `argocd` and reconciles this repository as its primary root.

- **Root Application**: `argocd/root-application.yaml`
- **Application Sync Policy**: Automated sync with self-heal enabled; auto-prune disabled initially for safety.
- **Child Repositories**:
  - IAM & Security: `https://github.com/fkc1e100/kube-agents-iam.git`
  - Workloads & Apps: `https://github.com/fkc1e100/kube-agents-apps.git`
