AWS VPN
Ingress and egress
Terraform
Node additions command line[Auto scale/Patching]
CIDR, IP range
- AWS vPc
- GCP
- Terraform
- Git
- DOcker


# List NAT IP's
iptables -L -t nat


Difference of kubernetes and docker swarm:
- Kubernetes can do auto-scaling.Setup is very complicated, but once installed cluster is robust.
- Installation is very simple, but the cluster is not robust.Docker swarm cannot do auto-scaling

Doker and kubernetes link:
- Docker builds the containers and these containers communicate with each other via Kubernetes. 
- So, containers running on multiple hosts can be manually linked and orchestrated using Kubernetes.

What is loadBalancer and ingress
- LoadBalancer on service can be individual only to the perticular service
- Ingress routes the traffic based on the path to respective services.

VPC:
IP Addresses are that addresses computers use to communicate.

Create 2 subnets:
1. Private subnet [No internet access]
2. Public subnet [It attached to internet GW, It has internet access]

NOTE: Subnet is a range of IP addresses in your VPC.

Create VPC -> 
Create InternetGW and attach to VPC -> 
Create public/Private subnets and attach to VPC -> 
Create routeTables[Default public RT created attach IGW and PublicSubnet, create privateRT and assosiate PrivateSubnet] ->
Security -> Network ACL & SG

GCP:
You can use some Gcloud commands resize clusters:
gcloud container clusters list --region us-west1
gcloud container clusters resize sample-cluster --num-nodes=2

---

## Recent Interview Q's:
- block connectivity between 2 pods in same namespace
  
  ```NetworkPolicy helps us to block egress on pod/container level.```

- reload configmap with out restarting pod
  
  ```We can have stakater reloaders ```
  
- Prometheus memory stats and HA
  
  ```Prometheus sould be configured to store fewer timeSeries, by scripting fewere metrics or by attaching fewer LABELS to timeSerieses.```

- Dont kill the pod if there are any connections on it. wait for it
  
  ```Have preStop lifeCycle hook to achieve this.```

- How to reverse a commit and push other changes
- print a number from list of lines.

mobile.txt:
bdfhabsdfbas9-9-9-9-9-9-9-9hsbdhjabcjsd
vdhvhsvdghsdg d 778-888-6543ckjasdcbjsdcjbd
987654-77777bdjbCBJSDSCDS C SM
dvcvwDVCHJWC NW CDNWDNMC NMWDNCM DMNC MN

Script:
```
❯ while read -r line; do echo $line |grep -o '[0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}\|[0-9]\{5\}-[0-9]\{5\}\|[0-9]\{1\}-.*[0-9]\{1\}'|sed 's/-//g'; done < mobile.txt
99999999
7788886543
8765477777

❯ echo "kjbDFKJbfjd10.3.4.5jjbsdba" |grep -o '[0-9]\{2\}.*.[0-9]\{1\}'
10.3.4.5
```
---
## Marvel
How to block the communication btween pods.
---
Why to choose VM, instaed kubernetes cluster.
 If you have existing applications that are designed to run on a specific operating system or hardware platform, using a VM can be a good option. VMs allow you to run applications on different hardware and operating systems without having to modify the application code.

Scalability: Kubernetes clusters are designed to be highly scalable, allowing you to easily add or remove nodes as needed to handle fluctuations in traffic or workload. This makes it easy to scale your application as it grows.
---
Enable communication between 2 gke cluster in a project
Load Balancing: You can use load balancing to enable communication between two GKE clusters by exposing a service on one cluster and then configuring a global load balancer to route traffic to the other cluster. This approach is useful if you only need to expose a small number of services between the two clusters.
---
How to block the IP on application layer.

To block an IP address on the application layer of an AWS VPN, you can use a Web Application Firewall (WAF) that is integrated with Amazon's Virtual Private Cloud (VPC) service
---
How the mongo sharded cluster pods communicate each other.

rs.initiate
---

What is replica and a shard
replica set is a group of MongoDB servers that maintain copies of the same data.
a shard in MongoDB is a partition of data across multiple servers or nodes. A sharded cluster consists of multiple shards, where each shard contains a subset of the data.
---

How to block communication on a service to external world.
---
What happenes when etcd fails
When Etcd fails, Kubernetes will lose access to all of the configuration data that was stored in Etcd. This means that Kubernetes will be unable to locate pods and services, and it will not be able to make any changes to the cluster configuration.

---
setuid and getuid
---
How to limit network traffic on NAT IP
Use caching: If possible, use caching to reduce the amount of traffic that needs to pass through the NAT. For example, you can use a caching solution like Amazon CloudFront to cache frequently accessed content.
---

Kube-proxy and CNI (Container Network Interface) are two separate components in a Kubernetes cluster that serve different purposes.
Kube-proxy manages the virtual IP addresses and ports used by services and ensures that traffic is directed to the appropriate backend pods.

CNI is a plugin-based networking solution that provides connectivity between pods and between pods and the outside world. CNI plugins are responsible for configuring the network interfaces of each pod and providing routing and IP address management.
---





