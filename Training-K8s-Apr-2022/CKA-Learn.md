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

#### 22-APR-2022
- Projects, Cluster, Nodes, Pods, and Containers
- POD YAMLS and ReplicaSets

- How to create a service imperitive approach
```
kubectl expose pods webserver --port 8080 --type LoadBalancer -n lab --dry-run=client -o yaml
```
- Taints and Tolerations

###### TAINT Effects: 
- NoSchedule: Dont schedule any pod on the node.
- PreferNoSchedule: System tries to not schedule any pod on the node, but no guarenty.
- NoExecute: No new pod will schedule on the node and existing pods will evict if they can not tolarate the taint.

```
kubectl taint node <NODENAME> value:NoSchedule
```

#### 26-APR-2022
- Creating jobs and cronJobs
- What are services and types of services: https://kubernetes.io/docs/concepts/services-networking/service/
- NodePort, ClusterIp


#### 29-APR-2022
- What are configMaps and Secrets
- How to create and mount them on a POD/DEPLOYMENT



