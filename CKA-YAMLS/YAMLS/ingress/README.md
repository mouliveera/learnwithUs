Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster.

Traffic routing is controlled by rules defined on the Ingress resource.

#### Ingress Controllers
In order for the Ingress resource to work, the cluster must have an ingress controller running.

---
Ingress typically uses a service of type Service.Type=NodePort or Service.Type=LoadBalancer.


