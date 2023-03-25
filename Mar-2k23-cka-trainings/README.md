## 6 Mar 2023
- History on Kubernetes https://kubernetes.io/docs/concepts/overview/

## 8 Mar 2023
- [Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/)

```
Kubernetes is a complex system that comprises several components working together to manage containerized applications and services. The core components of Kubernetes include the API server, etcd, kube-scheduler, cloud-controller-manager, kubelet, kube-proxy, container runtime, and the controller manager.
```

**API server:** The API server is the central control plane component that provides a RESTful API for managing the Kubernetes cluster.

**etcd:** Etcd is a distributed key-value store that stores the state of the Kubernetes cluster.

**kube-scheduler:** The kube-scheduler is responsible for scheduling pods to run on available nodes in the cluster based on resource requirements, affinity, anti-affinity, and other policies.

**cloud-controller-manager:** The cloud-controller-manager is responsible for managing the interactions between Kubernetes and the underlying cloud provider, such as creating and deleting load balancers, managing network routes, and more.

**kubelet:** The kubelet is an agent that runs on each node in the Kubernetes cluster and is responsible for managing the state of the pods running on that node.

**kube-proxy:** Kube-proxy runs on each node in the Kubernetes cluster and is responsible for managing network connectivity between Kubernetes services and pods.

**Container runtime:** The container runtime, such as Docker or Containerd, is responsible for starting and stopping containers based on the pod specifications.

**Controller manager:** The controller manager is responsible for running Kubernetes controllers, which are processes that monitor the state of the Kubernetes cluster and make changes to bring it to the desired state.

## 9 Mar 2023
- Created minikube 2 node cluster
```
minikube start --nodes 2 -p multinode-minikube
```
- Validated cluster and nodes.
```
kubectl get nodes
```
- [Kubectx](https://formulae.brew.sh/formula/kubectx): Its a command line tool to switch clusters.
- How to list clusters configured in our local machine.
```
kubectl config get-contexts
```
- Rename cluster name as per our convenience.
```
kubectl config rename-context  <CLUSTER NAME> <RENAME>
Ex:
kubectl config rename-context  multinode-minikube demo
```
- Using `kubectl` we can do CRUD[Create, Read, Update[Modify],Delete] operations.
- Imperative[Command line] and Declarative[YAML] approaches to create K8s objects.
```
# Imperative Example
kubectl run demo-pod --image=nginx

# To view the YAML for above commands
kubectl run demo-pod --image=nginx --dry-run=client -o yaml

- dry-run: Test run
- o: output
```
## 15 Mar 2023
## Namespaces
In Kubernetes, a namespace is a way to logically divide and isolate a cluster's resources. Each namespace provides a scope for Kubernetes objects like pods, services, and deployments, and helps to avoid naming collisions and provide better organization of resources within a cluster.

Some examples of namespaces in Kubernetes are:

- default: This is the default namespace that Kubernetes creates for all resources that don't have a specified namespace. It's recommended to create new namespaces for different environments like development, testing, and production, instead of using the default namespace.

- kube-system: This namespace is reserved for Kubernetes system resources like kube-dns, kube-proxy, and other system-level services that are critical for the operation of the cluster.

#### Creating a Namespace:
You can create a namespace in Kubernetes by using the kubectl create command with the namespace resource type, followed by the name of the namespace you want to create.

For example, to create a namespace called "development", you can run the following command:
```
kubectl create namespace development
```
This will create a new namespace called "development" in your Kubernetes cluster.

#### Listing Namespaces:
You can list all the namespaces in your Kubernetes cluster by using the kubectl get command with the namespace resource type.
```
kubectl get namespaces
```

You can also use the kubectl describe command to get more detailed information about a specific namespace. For example, to get detailed information about the "development" namespace, you can run the following command:
```
kubectl describe namespace development
```

## 16 Mar 2023 && 17 Mar 2023
## ReplicaSets
- A ReplicaSet is a Kubernetes object that helps to ensure a desired number of replicas of a particular pod are running at all times.
- Here's an example of how to create a ReplicaSet using Kubernetes YAML manifest:
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx-replicaset
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest

```

- Ref: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/

## Deployments
- A Deployment is a higher-level Kubernetes object that manages a set of replica pods for your application, ensuring that the desired number of replicas is running at all times. It provides an easy way to roll out updates to your application with minimal downtime, and to roll back to a previous version if necessary. 
- Example yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

`NOTE: The main difference between a ReplicaSet and a Deployment in Kubernetes is that a Deployment provides declarative updates to manage replicas of your application and is responsible for managing the overall lifecycle of your application, while a ReplicaSet is focused on maintaining a specific number of replicas for a given pod template.`

## 18 Mar 2023
`kubectl apply`: This command applies a configuration file to the Kubernetes cluster. It can be used to create, update, or delete resources in the cluster.

`kubectl get`: This command is used to retrieve information about Kubernetes resources.

For example, **kubectl get pods** will retrieve a list of all running pods in the cluster.

`kubectl describe`: This command provides detailed information about a Kubernetes resource.

For example, **kubectl describe pod <pod-name> -n namespace** will provide detailed information about a specific pod.

`kubectl logs`: This command retrieves logs from a container running in a pod.

For example, **kubectl logs <pod-name> -n namespace** will retrieve logs from the first container in a pod.

`kubectl exec`: This command is used to execute a command in a running container.

For example, **kubectl exec -it <pod-name> -n namespace -- <command>** will execute a command in the first container in a pod.

`kubectl delete`: This command is used to delete a Kubernetes resource.

For example, **kubectl delete pod <pod-name> -n namespace** will delete a specific pod.

`kubectl create`: This command is used to create Kubernetes resources from a YAML or JSON file.

For example, **kubectl create -f <file-name>.yaml -n namespace** will create resources defined in the specified YAML file.

## What we discussed
#### Where do we use the deployment pods
Here are some reasons why Deployments are commonly used for stateless applications:

`Easy scaling:` Deployments allow you to easily scale the number of replicas (pods) that are running your application. This is particularly useful for stateless applications because they can handle multiple replicas of the same pod without any data conflicts or consistency issues.

`Pod identity:` Pods managed by a Deployment are anonymous and interchangeable. This means that if a pod fails, it can be replaced by a new pod with new name and IP without any consideration for its identity.Pod identity is important because it determines which pod is responsible for managing which data.

## StatefulSets
Like a Deployment, a StatefulSet manages Pods that are based on an identical container spec. Unlike a Deployment, a StatefulSet maintains a sticky identity for each of its Pods. These pods are created from the same spec, but are not interchangeable: each has a persistent identifier that it maintains across any rescheduling.

If you want to use storage volumes to provide persistence for your workload, you can use a StatefulSet as part of the solution. Although individual Pods in a StatefulSet are susceptible to failure, the persistent Pod identifiers make it easier to match existing volumes to the new Pods that replace any that have failed.

#### Example YAML:
```
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: demo-statefulset
spec:
  serviceName: "nginx"
  replicas: 6
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
      - image: nginx:1.22
        name: nginx-test
```

## DaemonSets
DaemonSets are a Kubernetes resource that allow you to run a single pod on each node in a cluster. DaemonSets are useful for running system-level agents on each node, such as log collectors, monitoring agents, or storage plugins.

When you create a DaemonSet, Kubernetes will automatically create a pod on each node in the cluster that matches the specified selector. If a new node is added to the cluster, Kubernetes will automatically create a new pod on that node. Similarly, if a node is removed from the cluster, Kubernetes will automatically delete the pod running on that node.

#### Example YAML
```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: demo-deamons
spec:
  selector:
    matchLabels:
      app: demo
  template:
    metadata:
      labels:
        app: demo
    spec:
      containers:
      - image: nginx:1.22
        name: nginx-test
```

## 22 Mar 2023
## Services
- In Kubernetes (k8s), a Service is an abstract way to expose an application running on a set of Pods as a network service.

- A Service provides a stable IP address and DNS name to connect to the Pods, regardless of any changes that might occur in the Pod IP addresses.


#### Here are a few examples of how Services can be used in Kubernetes:

- Load Balancing: A Service can load-balance traffic between multiple Pods that are running the same application.
- Service Discovery: A Service provides a single, stable DNS name and IP address that can be used to discover and connect to the Pods running the application.
- Routing: A Service can route traffic to different Pods based on various criteria, such as load, version, or custom labels.
- To list all the Services in a Kubernetes cluster
```
kubectl get services
```
This will list all the Services in the default namespace. To list Services in a specific namespace, you can use the -n flag followed by the namespace name:
```
kubectl get services -n <namespace>
```
- To describe a specific Service
```
kubectl describe service <service-name>
```
This will provide detailed information about the Service, including its IP address, ports, selectors, and endpoints.

- Kubernetes supports several types of Services, each with its own purpose and functionality.
#### NodePort Service: 
- This type of Service exposes the Service on a static port on each Node in the cluster. It allows external traffic to access the Service by using the Node's IP address and the static port.
- Example YAML:
```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
    - name: http
      port: 80
      targetPort: 8080

```


