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