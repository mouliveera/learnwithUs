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


#### How to apply the configMap changes withOut restarting pods.
- We can use few annotations to do that.
- Add below annotations at metadata to configMap
```
  annotations:
    reloader.stakater.com/match: "true"
```
- Add below annotations at metadata to deployment
```
  annotations:
    reloader.stakater.com/search: "true"
```
- Reference yaml below
- Example:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: first-deployment
  labels:
    app: nginx-test
  annotations:
    reloader.stakater.com/search: "true"
spec:
### REPLICASET SPEC ####
  replicas: 2
  selector:
    matchLabels:
      app: nginx-test
### POD SPEC ###
  template:
    metadata:
      name: mouli
      labels:
        app: nginx-test

    spec:
      containers:
        - name: chaitu
          image: nginx
          volumeMounts:
          - name: firstdeploy-cm
            mountPath: /usr/share/nginx/html/
      volumes:
      - name: firstdeploy-cm
        configMap:
          name: firstdeploy-cm

---
apiVersion: v1

kind: ConfigMap

metadata:
  name: firstdeploy-cm
  annotations:
    reloader.stakater.com/match: "true"

data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <body>

    <h1>This is a TEST NGINX page</h1>

    <p>By MouliDeepika</p>

    </body>
    </html>

```
- Do port-forward to the deploy
```
k port-forward deploy/first-deployment -n demo 8088:80
```
- Open browser and access https://127.0.0.1:8088
- Make changes to configmap YAML and APPLY.
- reload webpage [127.0.0.1:8088]

