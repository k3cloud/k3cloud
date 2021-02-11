# k3cloud

### Cluster + Domain Setup
1. Create Cluster:
`civo k3s create k3cloud --applications=Traefik,system-upgrade-controller,metrics-server,Helm --size=g2.medium --nodes=3 --wait --region=NYC1`
 
2. apuntar dominios

### k3s cluster setup
1. Test connectivity: `kubectl get no`
2. `kubectl apply -f prd/argocd/argo-namespace.yaml`
3. `kubectl apply -n argocd -f prd/argocd/argo-install.yaml` [Origin](https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml)
4. Log into argo [`kubectl port-forward svc/argocd-server -n argocd 8080:443`] URL=localhost:8080 | usr=admin | pwd=<POD-name> [eg: argocd-server-7696cd5f89-27spf]
5. Link repos (k3cloud/k3cloud) + import application templates under prd/argocd/pipelines
