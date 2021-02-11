# k3cloud

## Cluster Setup
### Cluster Creation
* `civo k3s create k3cloud --applications=Traefik,system-upgrade-controller,metrics-server,Helm --size=g2.medium --nodes=3 --wait --region=NYC1`
* Redirect domains


### cert-manager + prometheus 
1. Install cert-manager:
  * `kubectl apply -f cert-manager/` [Source](https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml)

2. Install prometheus stack
  * `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
  * `helm repo add stable https://charts.helm.sh/stable`
  * `helm repo update`
  * `kubectl apply -f prd/monitoring/monitoring-namespace.yaml`
  * `helm install --namespace monitoring prometheus prometheus-community/kube-prometheus-stack`


### argo pipelines setup
1. `kubectl apply -f prd/argocd/argo-namespace.yaml`
2. `kubectl apply -n argocd -f prd/argocd/argo-install.yaml` [Source](https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml)
4. Import pipelines: `kubectl apply -f prd/argocd/pipelines/`

#### Login details
Log into argo [`kubectl port-forward svc/argocd-server -n argocd 8080:443`] URL=localhost:8080 | usr=admin | pwd=<POD-name> [eg: argocd-server-7696cd5f89-27spf]
