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


