## 24-05-2022
- Create a gitHub account
- Copy ssh keys to your profile.
```
ssh-keygen
> Enter
> Enter
> Enter
---
# cd to your home directory
# You can view id_rsa, id_rsa.pub
cd ~/.ssh/
ls -l

cat id_rsa.pub

Add that key to SSH keys in gitHub.
```

Follow: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
---
#### Commands:
- git clone <REPOSITORY_URL> # How to clone a repo
- git branch  # List the gitHub branches
- git checkout -b <"NEW_BRANCH_NAME"> # For creating a new branch
- git checkout <BRANCH> # Change the branch
- git status # List the files modified/added/removed
- git add <fileName> # Adding files to local brach
- git add .  # Add all files at a time
- git add -A # Same as above^^
- git commit # Short description note for the changes
- git push origin <BRANCH_NAME> # Push the changes to remote branch
- git pull # Pull the latest changes from remote branch

#### Tools:
- Markdown page document: https://www.markdownguide.org/basic-syntax/
- Terminals for windows: https://alternativeto.net/software/iterm2/?platform=windows [ubuntu is recommended]


## 27-05-2022
- How to configure GitHub MFA and SSH keys. ref: https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication
- GitHub Primary and secondary emails.
- AWS cli configure. Ref: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- AWS IAM Access and Secret keys.
- AWS IAM console and commands line access.

## 30-05-2022
- How to create an EC2 instance manually.
- How to  create using command line:
```
aws ec2 run-instances --image-id ami-09d56f8956ab235b3 --count 1 --instance-type t2.micro --key-name 2022-keys --security-group-ids sg-0f3fe841c82949693 --subnet-id subnet-0
c70565aaa3cb5ddc --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=commanLine-1}]' --profile personal
```

Source: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html

- How to login to the EC2 instances.
- Fill out root disk and resizing ROOT disks.
- Rough Notes
 ```
 # Create a 5Gb file
 ubuntu@ip-10-0-1-109:/$ sudo fallocate -l 5G file.out

 ---
 ubuntu@ip-10-0-1-52:~$ lsblk
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 26.6M  1 loop /snap/amazon-ssm-agent/5163
loop1      7:1    0 55.5M  1 loop /snap/core18/2344
loop2      7:2    0 61.9M  1 loop /snap/core20/1405
loop3      7:3    0 79.9M  1 loop /snap/lxd/22923
loop4      7:4    0 43.6M  1 loop /snap/snapd/15177
xvda     202:0    0   12G  0 disk
├─xvda1  202:1    0  7.9G  0 part /
├─xvda14 202:14   0    4M  0 part
└─xvda15 202:15   0  106M  0 part /boot/efi
ubuntu@ip-10-0-1-52:~$ ^C
ubuntu@ip-10-0-1-52:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       7.6G  6.5G  1.2G  86% /
tmpfs           484M     0  484M   0% /dev/shm
tmpfs           194M  828K  193M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda15     105M  5.3M  100M   5% /boot/efi
tmpfs            97M  4.0K   97M   1% /run/user/1000

ubuntu@ip-10-0-1-52:~$ sudo growpart /dev/xvda 1
CHANGED: partition=1 start=227328 old: size=16549855 end=16777183 new: size=24938463 end=25165791
ubuntu@ip-10-0-1-52:~$ sudo resize2fs /dev/xvda1
resize2fs 1.46.5 (30-Dec-2021)
Filesystem at /dev/xvda1 is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 2
The filesystem on /dev/xvda1 is now 3117307 (4k) blocks long.

ubuntu@ip-10-0-1-52:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        12G  6.5G  5.0G  57% /
tmpfs           484M     0  484M   0% /dev/shm
tmpfs           194M  828K  193M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda15     105M  5.3M  100M   5% /boot/efi
tmpfs            97M  4.0K   97M   1% /run/user/1000
 ```

Ref: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html

## 31-05-2022

- Discussed docker image concepts
- Rough notes:
- Dockerfile:
```
FROM ubuntu:20.04
COPY ./mveera /mveera
CMD ["/mveera"]
RUN apt update
RUN apt-get install redis -y
```

- Build an image
```
docker build -t mveera-ubuntu-redis:latest .
docker images
```
- Login to docker container
```
docker ps # Lists the containers running
dcoker exec -it <CONTAINER-ID> bash # Login
```

- Create a container with an image and login to the container
```
docker run -it <IMAGE ID>  bash
```

- Create a container in detach mode
```
docker run -it -d <IMAGE ID>  bash
```

- Docker login to your account and push the images to the DockerHub
```
docker login   #Login to you dockerHub account

docker images

docker tag <IMAGE ID> <YOUR IMAGE NAME>:<TAG>
Ex:
docker tag b55df6b4b60d mveera-ubuntu-redis:1.0 #Give a tag[Commit in gitHub] to the image
```
---
```
docker image push <REGISTRY NAME>/<YOUR IMAGE NAME>:<TAG>
Ex:
docker image push mouliveera/mveera-ubuntu-redis:1.0
```

Sources:
- https://docs.docker.com/engine/reference/commandline/tag/
- https://docs.docker.com/engine/reference/commandline/push/

## 6-6-2022

- EC2 instance created
- Installed AWS cli
```
	- apt-get update
	- apt-get install aws
```
- Configured AWS authentications[AccessKeys and SecretKeys]
- run aws cli commands
```
	- aws s3 ls --profile <profile name>
```
- Create an AMI and use it for next EC2 instance.


#### Try:
1.
```
- Create an IAM role with s3 permissions.
- Attach it to EC2 while creating an instance.
- Try running 
```

---
2.
```
- Create an EC2 instance
- Install OpenVpn
- and access it in your web browser.
```

## 13-05-2022

- Docker image clean up.
- Docker service and networks
- What are AMI's[Amazon images], docker images and kubernetes.
- How to check the size of each step in docker image build process
```
docker history <IMAGE-ID>
```

- Some useful commands: Docker
```
❯ docker image ls
❯ docker image prune --filter=dangling=true

❯ docker image prune -a --force --filter "until=168h"

With force option, it wont promt for yes/no option.

7 days = 168hours

```
- prune: is useful to clean and docker resource[Like images, container, volumes, etc]

TASK Given:

- Create a sample web service with 2 replicas.
- Check how the service distributes traffic between the containers.

Ref: https://docs.oracle.com/cd/E37670_01/E75728/html/docker-swarm-service-create.html

## 20-06-2022

- What are services in Docker, how they manage container under them.
- What are LABELS, how we filter the containers.


Task: 
1. Create multiple containers with different LABELS.

```
Ex:
Create containers with followeing labels
env=dev
env=qa
env=prod

docker ps --filter label=env={ENV}
ex:
docker ps --filter label=env=dev
docker ps --filter label=env=qa
```

2. 
- Create 2 ec2 instances in AWS.
- Create a LoadBalancer[LB] and attach Ec2 instances to that LoadBalancer. It should be NetworkLoadBalancer.

Whenever you hits the loadBalancer URL in webBrowser, it should goto the random EC2 instances


READ: What are loadBalancers types
https://aws.amazon.com/elasticloadbalancing/

## 21-06-2022
- Conclusion on Docker
- Orchestration tools[Docker swarm, K8s]
- What is kubernetes and why to use.
- Local initial setup of kubernetes

#### Required tools:
- Docker Desktop
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)
- [kubectx](https://developers.redhat.com/blog/2019/05/27/command-line-tools-for-kubernetes-kubectl-stern-kubectx-kubens#stern)

## 22-06-2022
- We discussed
#### Control Plane Components
- kube-apiserver
- etcd
- kube-scheduler
- kube-controller-manager
- cloud-controller-manager

#### Node Components
- kubelet
- kube-proxy
- Container runtime

Please go thru [Kubernetes Components](https://kubernetes.io/docs/concepts/overview/components/)

## 23-06-2022
- Why do need to use Minikube[It is for local testing]
- What are different kubernetes services in different clouds. [EKS(aws), GKE(GoogleCloudPlatform), AKS(Azure)]
- How to create eks cluster in AWS.
```
eksctl create cluster --name <CLUSTER-NAME> --region <REGION>

Ex:
eksctl create cluster --name demo-cluster --region us-east-1 --profile personal
```
- How to delete the eks cluster
```
eksctl delete cluster --name demo-cluster --region us-east-1 --profile personal
```
- How to start multi node minikube cluster in local.
```
minikube start --nodes 2 -p multinode-demo
```

- How to stop
```
minikube stop -p multinode-demo
```

Ref: https://minikube.sigs.k8s.io/docs/tutorials/multi_node/

## 24-06-2022
- CRUD operations 
```
Create, Read, Update[Modify],Delete.
```
CREATE: 
```
kubecrl APPLY -> To create a resource in kubernetes

Ex:
kubectl run nginx --image=nginx
kubectl apply -f YAML
```
READ: 
```
kubectl get <RESOURCE NAME>
kubectl describe <RESOURCE NAME>


Ex: 
kubectl describe pod PODNAME
kubectl get pod PODNAME
```
UPDATE: 
```
kubectl edit <RESOURCE NAME>
```
DELETE: 
```
kubectl delete <RESOURCE NAME> 

Ex: kubectl delete pod PODNAME
```

- What is a [pod](https://kubernetes.io/docs/concepts/workloads/pods/)
- How we can use pods to manage containers.
- How can we create a PODs with multi containers. 

## 28-06-2022
- What are liveness and readinessProbes
- Why do we need to use them.
- [LINK](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/)
- How can we set CONTEXT and NAMESPACE using kubectl commands
```
kubectl config set-context <CLUSTER> --namespace <NAMESPACE>

Ex:
kubectl config set-context docker-desktop --namespace naresh
```

## 29-06-2022
#### ReplicaSet
- What is a replicaSet
- A ReplicaSet's purpose is to maintain a stable set of replica Pods running at any given time
- How they manage PODS.
- Ref: [LINK](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#:~:text=A%20ReplicaSet%20is%20defined%20with,the%20number%20of%20replicas%20criteria.)

## 30-06-2022
#### Deployment
- A Kubernetes Deployment is used to tell Kubernetes how to create or modify instances of the pods that hold a containerized application. Deployments can scale the number of replica pods, enable rollout of updated code in a controlled manner, or roll back to an earlier deployment version if necessary. 

- Ref [LINK](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- Refer the YAML's in k8s directory 

## 04-07-2022
- How can configure kubernetes cluster to our local machine.
- [GCP](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl)
- [AWS](https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/)
- How we use the deployment in realTime

Task:
- Create 2 deployments in different namespaces.
- Crash one of the deployments with typo or however your want.
- List the pods, which are failing and in which namespace.
- Troubleshoot why they are failing and share the reason for faulure.

## 05-07-2022
- What are initContainers.
- specialized containers that run before app containers in a Pod. 
- Init containers can contain utilities or setup scripts not present in an app image.
- To avoid load on actual containers, we use initContainers in the pod.
- Here is an example to create a initContainer.
- It create a folder `trainings` and a file `test.txt` before the acual container `my-container` start and mounts on `trainings`
```
apiVersion: v1
kind: Pod
metadata:
  name: init-test-pod
spec:
  volumes:
  - name: trainings
    emptyDir: {}
  initContainers:
  - name: init-container
    image: busybox:1.28
    command: ['sh', '-c', 'mkdir /trainings; touch /trainings/test.txt']
    volumeMounts:
    - name: mydir
      mountPath: /trainings
  containers:
  - name: my-container
    image: alpine
    command: ['sh', '-c', 'if [ -f /trainings/test.txt ]; then echo "hello team, this is a test file" > /trainings/test.txt; sleep 99999; fi']
    volumeMounts:
    - name: mydir
      mountPath: /trainings
```

- Login to pod and check for status
```
kubectl exec -it init-test-pod -c my-container -n demo -- cat /trainings/test.txt
hello team, this is a test file
```

## 06-07-2022
- (InitContainers)[https://kubernetes.io/docs/concepts/workloads/pods/init-containers/]
- (StatefulSets)[https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/]
- StatefulSets are intended to be used with stateful applications
- (DeamonSets)[https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/]
- A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.

## 07-07-2022
- What is a (cronJob)[https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/]
- CronJobs are meant for performing regular scheduled actions such as backups, report generation, and so on.
- How to create cronJobs and Jobs.
- How can we create manual job using a cronJob.
```
kubectl get cj -n demo             
NAME        SCHEDULE       SUSPEND   ACTIVE   LAST SCHEDULE   AGE
demo-cron   */10 * * * *   False     0        2m9s            14m

---
kubectl create job manual-demo-job --from=cronjob/demo-cron -n demo --context docker-desktop
job.batch/manual-demo-job created

---
kubectl get job -n demo
NAME                 COMPLETIONS   DURATION   AGE
demo-cron-27619438   1/1           4s         21m
demo-cron-27619440   1/1           4s         19m
demo-cron-27619450   1/1           3s         9m44s
demo-job             1/1           4s         8m21s
manual-demo-job      1/1           4s         3m45s
```
- What are services.

## 12-07-2022
- [ClusterIP](https://kubernetes.io/docs/concepts/services-networking/service/)
  They are accessible with in the cluster, you can reach them by port-forwarding.
- [LoadBalancer](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/)
  We have to create LB on each service which creates cost impact.
- How kubernetes manages the [DNS records](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

Commands:
```
kubectl get services -n demo
kubectl describe service <SERVICE NAME> -n demo
```

## 13-07-2022
- https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
- GuestBook
- Enable ingress on minikube: it creates a pod in ingress-nginx namespace. the pod manages the ingressRules.
```
 minikube addons enable ingress  
```
- Run below commands to apply ingress and get the ingress details.
```
kubectl apply -f ingress.yaml
kubectl get ingress
kubectl describe ingress gbook-ingress
```
- Open web browser and access the IP it generated

