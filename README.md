# k3cloud

### Cluster + Domain Setup
1. Create Cluster:
`civo k3s create k3cloud --applications=Traefik,system-upgrade-controller,metrics-server,Helm --size=g2.medium --nodes=3 --wait --region=NYC1`
2. Test connectivity: `kubectl get no`
3. redirect domains


### cert-manager + Monitoring setup 
1. Install cert-manager:
`kubectl apply -f cert-manager/` [Source](https://github.com/jetstack/cert-manager/releases/download/v1.2.0/cert-manager.yaml)

2. Install prometheus stack
`helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
`helm repo add stable https://charts.helm.sh/stable`
`helm repo update`
`kubectl apply -f prd/monitoring/monitoring-namespace.yaml`
`helm install --namespace monitoring prometheus prometheus-community/kube-prometheus-stack`



### k3s cluster setup
1. `kubectl apply -f prd/argocd/argo-namespace.yaml`
2. `kubectl apply -n argocd -f prd/argocd/argo-install.yaml` [Source](https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml)
3. Log into argo [`kubectl port-forward svc/argocd-server -n argocd 8080:443`] URL=localhost:8080 | usr=admin | pwd=<POD-name> [eg: argocd-server-7696cd5f89-27spf]
4. Link repos (k3cloud/k3cloud) + import application templates under prd/argocd/pipelines

