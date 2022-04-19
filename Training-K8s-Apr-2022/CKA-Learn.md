## Lean CKA

#### 13-APR-2022
- Docker learning vidoes: https://www.youtube.com/watch?v=zJ6WbK9zFpI
- Installation of DockerDesktopTool: Docker desktop[Container runtime]: https://www.docker.com/products/docker-desktop/
- Test bed for K8s: Minikube: https://minikube.sigs.k8s.io/docs/start/

---
- What is kubernetes[K8s]
- Control Plane Components
```
kube-apiserver
etcd
kube-scheduler
kube-controller-manager
cloud-controller-manager
```

#### 14-APR-2022
- GitHub: Creation of branch anc commits
- Node components
- SETUP
- kubectl installation: https://kubernetes.io/docs/tasks/tools/
- kubectx

#### 19-APR-2022
###### CRUD
- create
- read
- update
- delete

- How to create a POD manually: imperative approach
```
❯ kubectl run lab-nginx --image nginx --namespace lab --dry-run=client -o yaml
```
