# DevOps Interview Q's
## AWS:
1. What are the most commons services that you used in AWS
```
EC2, EBS, CloudWatch, S3 Buckets, Route53[DNS solution in AWS], IAM, VPC, CLoudFront.
```
2. What is EC2, Did you managed them manually or any automated way.
```
- EC2 - Elastic Cloud Compute, is VM in AWS environment. We have different types of EC2 instances in AWS like t2.micro, t2.small, c3.large and etc.
- We created EC2 instances based on developer application memory and CPU requirements.

- I worked creating EC2 instances manually and also automated way using ansible-playbooks.
```
---
**Manual way:**
```
- Goto AWS console
- Choose EC2 service and region on the top right corner, where you want to launch instance. Click NEXT
- Click on create instance and choose instance type[as per dev's requirement]. Click NEXT
- Select VPC and SUBNET[Private/Public]. Click NEXT
- Add EBS Volume, if they need extra disks excluding ephemeral storage. Click NEXT
- Choose keys if you have any or create new key pair which helps to login to the instance, once it is UP and healthy. Click Review and Create.

```

**Automated way:**
```
- We can write ansible playbooks with respective roles and tasks which includes set of steps to spin up EC2 instance in AWS Console.
```

3. What is a Key pair that you use while creating EC2 instances
```
- It helps us to login to the instance after we created it. Its a .pem or .rdp file.
- We better save them in a safe place like GitHub or BitBucket[What ever we use]
```
4. How do you login to a Ubuntu EC2 instance
```
We can use SSH to login to EC2 ubuntu insatnce.
```
`ssh hostname -i KeyFile` (If DNS is configured)

(or)

`ssh IPAddress -i KeyFile` (If no DNS Configured)

5. If SSH fails while login to EC2 instance, what do you do.
```
I will check, why the instance login fail using -vvv options
```
---
**Command:**
```
ssh IpAddress -i KeyFile -vvv

-vvv : It takes the SSH to debug mode, we can use -v as well.

In debug mode it will give some hints, whether instance is reachable or not. Or if there any issues related keys permissions.
```
6. Where we keep the SSH keys in your local work station.
```
We store key files in .ssh folder, which located in our home directory[$HOME]
```


7. What is EBS
```
- EBS[ElasticBlock Storage] is a block storage, It stays until we delete from EC2 instance in AWS console.
- By default EC2 instances comes with ephemeral storage, which is limited to instance[Say 32Gb, 64Gb]. If we want to create a extra disk, we can use EBS service to create an extra disk and attach it to EC2 instances.
```
8. Why we use S3[Simple Storage Service] buckets.
```
- You can use the S3 interface to store and retrieve any amount of data. It works on payment model is "pay as you go" means no limits for storage.
- In general we use it for static data[Which is consistanant, no change in data]
- For few applications, We might need to store more data on daily basis. We use S3 buckets to store the data.
```
9. Difference between EBS and S3.
```
- EBS: Administrator creates it with limited storage[Like 50Gb or 100Gb]. EBS volumes are limited to regions.
- Where as S3 is unlimited storage and S3 buckets can be shared between the AWS regions.
```
10. What is a VPC
```
- Its a Virtual private cloud. Which helps us to seperate/safeGaurd our AWS resources from OutSide network.
```
11. How do we setup VPC
```
    Create VPC ->
    Create InternetGW and attach to VPC ->
    Create public/Private subnets and attach to VPC ->
    Create routeTables[Default public RT created attach IGW and PublicSubnet, create privateRT and assosiate PrivateSubnet] ->
    Security -> Network ACL & SG
```

12. What is AutoScaling, where do you setup in AWS console.
```
- AutoScaling helps us to increase or descrease EC2 instances in AWS depends on respective resource usage.
- Some times the CPU or memory usage may grow depends on the traffic on those EC2 instances, We can set the limits on ELB[Elastic Load Balancer]
- If the CPU or Memory usage is > 80% on the ELB level, it creates a new EC2 instances to overcome the resource shortage issues.
```

13. What is ELB
```
- Elastic Load Balancer
- It balance or sends the traffic to under lying instances in a round robin way.
```
14. Why we need to use route53.
```
- It a DNS solution in AWS Cloud.
- We can create DNS records like A, AAAA, TXT, MX etc. in route53.
- Here 53 is DNS service port number.
- We can expose our application endpoint with domains to out side world by setting DNS records in AWS.
```
15. CloudWatch
```
- AWS CloudWatch is a monitoring solution that AWS provide to resources.
- We can monitor and create alerting to our mobiles/emails/Slack channels by usaing AWS SNS[Simple Notification Service] service.
- We can monitor Ec2 instance health. Whether instance is UP or Down etc.
```

16. CloudFront
```
- AWS CloudFront is a CDN service in AWS.
- It helps keep the static data available at AWS edge data centers, so that data and application pages are accessible with faster response.
```




## ANSIBLE:

1. What is ANSIBLE
```
- It is a configuration managemant tool.
- We can create and update any configuration accross many servers at a time.
```
2. Which backend mechanism ANSIBLE use.
```
- It uses SSH and it is developed in python.
- If SSH is configured on remote instances to be accessible from your local instance, using ANSIBLE you can make changes as per the requirements.
```
3. Do we need master and slave servers for ANSIBLE
```
- ANSIBLE is agent less, we no need to have master and slave setup.
- We just need to have SSH setup to use ANSIBLE.
```
4. How do you run dry run in ANSIBLE
```
- We can use --check option to run dryRun in Ansible PlayBook
```
5. What is the difference between ansible-adhoc and ansible-playbooks
```
- ansible-adhoc are the ansible commands that we use for one time activity against inventory hosts.
- ansible-playbook is a set of tasks that we include in main.yml file in tasks directory.
```
6. Ho do you create a ansble-plays and what are the default folders and files included.
```aidl
- We can use "ansible-galaxy" commands to create ansible-play directories.
  Commands: "ansible-galaxy init FOLDERNAME"
-------------------------------------------------------
- Default folders and files
├── README.md
├── defaults
├── files
├── handlers
├── meta
├── tasks
├── templates
└── vars

```
7. What is group_vars and host_vars
```
- Group_vars: Variable set that we use for group of instances that we list in host inventory file.
- Host_vars: Variable set that we use for individual instances that we list in host inventory file.
```
6. What is inventory file in ANSIBLE, where it is located.
```aidl
- Inventory file keeps all host[Server] related information.
- It located in under hosts directory which is in ansible default directory.
- It is an yml file.
```
7. How to check all the servers in inventory file are accesible or reachable.
```
ansbile-playbook -m ping all -i INVENTORY-FILE
```
8. How do you check the ansible version
```aidl
ansible -v
```

9. How do you run ansible-playbook against a hostgroup
```aidl
ansible-playbook -i hosts/INVENTORY-FILE -l HOSTGROUP PLAYBOOK.yaml
```

10. How do you check the ansible playbook errors.
```aidl
- We can run ansible playbook in debug mode[-vvv] to capture the all the errors and tasks included in the playbook.

Commands:
ansible-playbook -i hosts/INVENTORY-FILE -l HOSTGROUP PLAYBOOK.yaml -vvv
```

## GITHub
1. What is Git
```aidl
- Git is a Distributed Version Control system. 
- It lets you track changes made to a file and allows you to revert back to any particular change that you want to.
```
2. What is the difference between Git and Github and GitLab?
```
Git:
- Git is a version control system of distributed nature that is used to track changes in source code during software development. 
- The main objectives of Git are speed, data integrity, and support for distributed workflows.
-------------------
GitHub:
- Used to track yours changes in source code
- GitHub is a Git repository hosting service. 
- GitHub provides a Web-based graphical interface.
- It is managed by GitHub Cloud providers.
-------------------
GitLab:
- We can observe some similar features as Git and GitHub. But it is a hosted service.
- We can host GitLab as package and we can manage on our own.
```

3. What is the BRANCHING Strategy that you followed
```aidl
- We followed feature branch strategy.

- Clone remote master branch to local.
---
git clone REPOSITORY-NAME
---

- Create a feature or private branch in our local.
---
git checkout -b BRANCH-NAME
---

- Make necessary changes to respective files.

- Add all your changes to your local branch.
---
git add -A
---

- Give a commit message to your changes.
---
git commit -m "TICKET-NUMBER: Commit Message"
---

- Push your changes to repository.
---
git push origin BRANCH-NAME
---
```

4. What is a commit message
```aidl
Git commit is used to give a message to your changes that you made in your private branch.

Commands:
"git commit -m"
```
5. How to add files to PRIVATE BRANCH.
```aidl
- We can use "git add" commands to add files to your PRIVATE BRANCH.
- "git add -A": To add all modified/new/deleted files to your PRIVATE BRANCH.
```
6. How can you fix a broken commit
```
- In order to fix any broken commit, use the command “git commit --amend”. 
- When you run this command, you can fix the broken commit message in the editor.
```

7. What is a repository in Git
```
- Repository in Git is a place where Git stores all the files. 
- Git can store the files either on the local repository or on the remote repository.
- It helps us to track and maintain record against all files to store.
```

8. How can you create a repository in Git
```aidl
- You can create a repo manually from GitHub console.
- You can also use "git init" commands to create a repo
```

9. What is Git rebase
```aidl
- It helps us to rebase remote branch changes to local branch.
```

10. Git pull
``` 
- To pull the remote branch recent changes to local, we use "git pull"
- Before creating a private branch, it is advised to RUN "git pull", then create a branch to avoid merge conflicts.
```

11. How do we check the history of a file when/who made the changes.
```aidl
- We can use "git log" commands to check the history.
```
## BASH
1. Why we use BASH scripting
```aidl
- BASH Shell is a command-line interpreter between user and kernel.
- We use BASH to automate linux/unix/ubuntu repetative tasks.
```

2. What are the file permissions we need to give for a SHELL scripting file.
```aidl
- We need to give execute permissions to a shell script file.

Commands:
chmod +x SCRIPT-FILE.sh
```

3. What is a variable in SHELL
```aidl
- Variables are integral parts of Shell scripts.
- Variables usually store data either in the form of characters or numbers.

Commands:
- Assign a variable
---
NAME="KUMAR"
---

- Print variable
---
echo $NAME
---
```
4. How do we execute a shell script.
```
sh SHELL-SCRIPT-FILE.sh

(or)

./SHELL-SCRIPT-FILE.sh

(or)

#For Step by step execution process
sh -x SHELL-SCRIPT-FILE.sh 
```

5. How do you automate a SHELL script at perticular time
```aidl
- We can create a SHELL script and adjust it in cronJobs.
- CronJobs helps to repeat a task at give interval of time.

Setting up cron: file /etc/cron.d

minute <TAB> hour <TAB> "day of month" <TAB> month <TAB> "day of week"
```
6. How to run a script in the background?
```
Commands:
script-filename.sh &
```

7. How to check exit code of previously ran commands
```aidl
- We can find the status of commands, whether it was sucessfull or failure using exit codes.

Commands:
echo $?

- If the exit code returns "0" means, previous commands ran sucessfully.
- If the exist code returns other than "0" means, there was some issues with previously ran commands.
```

8. How to list last 30day old files in file system.
```aidl
- We can use find commands to search for files.

Commands:
find . -mtime +30 -print

(or)

find DIRECTORY -mtime +30
```

9. Remove a file or directory
```aidl
- use "rm" commands to remove file.
- use "rm -rf" commands to remove a directory.
```

10. Where we check the logs of file system.
```
- In linux/Ubuntu/Unix OS sytems, we can find the logs in /var/log/
```

11. How do you check disk space on Ubuntu machine
```aidl
- Use "df -h" commands to check the disk free.
- Use "du -sh *" commands to check the usage.
```

12. How will you debug a shell script?
``` 
We can turn on or off debugging options in the shell:

Add below options at the starting of the script.

Set -x: This displays commands and their arguments as they are being executed.
Set -v: It displays shell input lines in real-time as they are read.
```
13. Wht is sed command and awk command?
```aidl
SED: stream editor
- It is used for editing a file without using an editor.
- We can use "sed" commands to find and replace a word in a file.
```
---
```aidl
AWK:
- We use AWK commnds to cut and print output based on positions.

Commands:
# To print complete data in a file.
cat filename | awk '{print $0}' 

# We can use few options to cut and print output based on positions.
# It prints the first field in file
cat filename | awk '{print $1}' 
```

14. How to login to a server using SSH
```aidl
ssh server

(or)

ssh IPADDRESS
```

## Jenkins
1. What is Jenkins and why is it used?
```
- Jenkins is a continuous integration (CI) tool for real-time testing and reporting of smaller builds in a large chunk of code. 
- It is written in Java. It is used because it helps developers and testers work in tandem to detect and close defects early in the software development lifecycle and encourage automated testing of builds.
```

2. What are the advantages of using Jenkins?
```aidl
- Provides great collaboration between development and operations teams.
- We can automate integrations.
- We can track users who deployed the latest changes.
- Code errors can be detected as early as possible.
```
3. What is Continuous Integration, Continuous Delivery, and Continuous Deployment?
```
Continuous Integration:
- It is a DevOps software development practice that permits developers to combine/merge the changes to their code in the central repository to run automated builds and tests.

Continuous Delivery:
- It refers to the building, testing, and delivering improvements to the software code. 
- The most critical part of the CD is that the code is always in a deployable state.

Continuous Deployment:
- It is the ultimate stage in the DevOps pipeline. 
- It  refers to automatic release of any developer changes from the repository to the production stage.
```

4. Any idea on Jenkins pipeline?
```aidl
- The pipeline represents the continuous delivery and continuous integration of all the jobs in the SDLC and DevOps life-cycle.
```
5. Different pipelines in Jenkins?
```aidl
- CI/CD pipeline 
- Scripted pipelineDeclarative pipeline
```
6. What is DSL Jenkins?
```
- DSL stands for Domain Specific Language. 
- Jenkins job DSL is a plugin that allows us to define jobs in the programmatic form with minimal effort.
```

7. How do you restart jenkins
```aidl
- If it is installed on unix based system
Commands:
service jenkins restart

- From web interface
https://JenkinsURL/restart
```

8. Use of the JENKINS_HOME directory?
```
- JENKINS_HOME directory is the place where all the settings, logs, and configurations are stored. 
- It stores all this information in XML files.
```

9. How to create a jenkins jobs
```aidl
- Open the Jenkins dashboard and create a new item by clicking on 'new item'
- Enter the project name and, from the options, select 'Freestyle project'
- Click on OK
```

10. Defile parameters in Jenkins
```aidl
In Jenkins, a build can take many input parameters to execute. 

- To define parameters for the job, select the "this project is parameterized" box.
- The drop down "Add Parameter" is enabled with the parameter types list. Any number of parameters may be added in the list.
- There are several parameter types provided in the list. 
```


## Kubernetes
1. What's Kubernetes?
```aidl
- Kubernetes is an open-source container orchestration tool or system that is used to automate tasks such as the management, monitoring, scaling, and deployment of containerized applications.
- It is also known as K8s
- Orchestration refers to the integration of multiple services that allows them to communicate to accomplish a single goal. 
```
2. Differences between the Docker Swarm and Kubernetes?
```aidl
- Docker Swarm can’t do auto-scaling (as can Kubernetes).
- Docker scaling is five times faster than Kubernetes 
- Docker can deploy rolling updates but can’t deploy automatic rollbacks
- Kubernetes can deploy rolling updates as well as automatic rollbacks
```
3. What is a node in Kubernetes?
```
- A node is the smallest fundamental unit of computing hardware. 
- It represents a single machine in a cluster, which could be a physical machine in a data center or a virtual machine from a cloud provider.
```
4.What is a pod in Kubernetes?
```aidl
- Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.
- A Pod is a group of one or more containers.
```

5. What is a Namespace in Kubernetes?
```aidl
- Namespace is used to devide the cluster into virtual clusters.
- namespaces provides a mechanism for isolating groups of resources within a single cluster
```
6. How do you check pods running status in kubernetes cluster
```aidl
- You can use "kubectl get pods --contect CONTEXT-NAME -n NAMESPACE-NAME" to list out al pods in a cluster with specific namespace.
```

6. What are Daemon sets?
```
- A Daemon set is a set of pods that runs only once on a host.
```
7. What is a stetefulSet
```aidl
- Like a Deployment, a StatefulSet manages Pods that are based on an identical container spec. 
- Unlike a Deployment, a StatefulSet maintains a sticky identity for each of their Pods.
```
8. What is Kubectl and Kubelet?
```aidl
Kubectl:
- it basically provides the CLI to run commands against the Kubernetes cluster with various ways to create and manage the Kubernetes component.

Kubelet:
- This is an agent service which runs on each node and enables the slave to communicate with the kubernetes master.
```

9. How do you check events in a cluster.
```aidl
- To get the events of a cluster in kubernetes.
kubectl get events --context CLUSTER-NAME -A 
```

10. How do you troucbleshoot pod failures
```aidl
- We can use kubectl commands to check the pods health.
Commands:
---
kubectl get pods --context CONTEXTNAME -n NAMESPACE | grep POD-NAME 
---

- Check the pod failure reason, by describing pod name and check the reason for pod failure.
Commands:
---
kubectl describe pods PODNAME --context CONTEXTNAME -n NAMESPACE
---

- Check the pod failure logs
Commands:
---
kubectl logs PODNAME --context CONTEXTNAME -n NAMESPACE -f
---

- To check previous failed container log.
Commands:
---
kubectl logs PODNAME --context CONTEXTNAME -n NAMESPACE -c CONTAINER-NAME -p
---
```
11. What is ETCD?
```aidl
- It is a database in kubernetes.
- It stores the data in key value pair model.
```

12. How does rolling update happen.
```aidl
- When we perform a rolling update, it create a new pod with new code and let that pod come up.
- Once the newly created pods comes UP, old pods gets terminated in a rolling fassion.
```

13. How do you port-forward to a service.
```aidl
kubectl port-forward svc/SERVICENAME LOCAL-PORT-NUMBER:SERVICE-PORT-NUMBER --context CONTEXTNAME -n NAMESPACE 
```
## Monitoring tools
1. What are the monitoring tools you used.
```aidl
- Nagios and prometheus

Nagios:
- Helps in monitoring systems, networks, and applications.
- It uses SSH clients to poll and gather remote instance details.

Prometheus:
- Prometheus helps us to monitor remote instances based on metrics exposed on the instances.
- We need to have a node_exporter installed on nodes to gather the metrics.
```

2. What is NRPE?
```
- NRPE enables you to run plugins on remote Unix and Linux machines. 
- This way, Nagios can monitor local resources such as memory usage and CPU on remote components.
```
3. What is OID Nagios?
```
- The Simple Network Management Protocol (aka SNMP) uses Object Identifiers for defining the Management Information Base.
```

4. Where we find the nagios failure logs.
```aidl
/var/log/nagios.log
```

5. Start/Stop/Restart nagios service
```aidl
START:
service nagios start
---
STOP 
service nagios stop
---
RESTART
service nagios restart
```

6. What is the port number of prometheus and its node exporter.
```aidl
- Prometheus runs on "9090" port number.
 
- Node_exporter runs on 9100 port number
```

7. Why do we use GRAFANA
```aidl
- Grafana used to visualise the data that we gathered to prometheus.
- It runs on port number 443.
- We can create customised dashboards or we can use the existing dashboards from grafana official page.
```

8. How do we enable alerting for any node or pod failures.
```aidl
- We can use alertmanager to enable alerting, it works on 9093 port number.
```

9. What kind of database that prometheus use.
```aidl
- prometheus uses time series database.
- We have different time series databases, ex: InfluxDB, MongoDB.
```

## Elasticsearch
1. What is elasticsearch.
```aidl
- It is a noSQL database.
- It allows you to store, search, and analyze big volumes of data quickly and in near real time.
- It is based on the Lucene search engine.
```

2. What is the minimum number of nodes that we use to form elasticsearch cluster.
```aidl
- We need to use 3 nodes to form a cluster in any database. That a advised count.
```

3. What is a Cluster?

```
- A cluster is a collection of nodes which together holds data and provides joined indexing and search capabilities.
```

4. What is a document in ElasticSearch?
```
- In an Elastic search, a document is a basic unit of information that can be indexed. 
- It is expressed in JSON (key: value) pair. ‘{“user”: “nullcon”}’. 
- Every single Document is associated with a type and a unique id.
```
5. What is a Shard
```aidl
- Every index can be split into several shards to be able to distribute data. 
- The shard is the atomic part of an index, which can be distributed over the cluster if you want to add more nodes.
```

6. What is ELK stack
```aidl
E stands for ElasticSearch: It is used for storing logs.
L stands for LogStash: It is used for both shipping as well as the processing and storing logs.
K stands for Kibana: It is a visualization tool (a web interface) that is hosted through Nginx or Apache.
```

7. What is Mapping?
```aidl
- Mapping is a process that helps you define how a document is mapped to the search engine. 
- Its searchable characteristics are included fields are tokenized as well as searchable.
```

8. What is X-pack in elasticsearch
```aidl
- It enables security for elacticsearch, We can provide user based access on elasticsearch.
```

9. How do you check the ES cluster health and indices and shards.
```aidl
Cluster health:
Commands:
curl -s -XGET CLUSTERNAME:9200/_cluster/health?pretty
---
Cluster indices:
Commands:
curl -s -XGET CLUSTERNAME:9200/_cat/indices?pretty
---
Cluster shards:
Commands:
curl -s -XGET CLUSTERNAME:9200/_cat/indices?pretty
```

10. What is Elasticsearch health statuses.
```aidl
- Health status is expressed by three colors: green, yellow, and red. 

- A GREEN status means that all primary shards and their replicas are allocated to nodes. 
- A YELLOW status means that all primary shards are allocated to nodes, but some replicas are not. 
- A RED status means at least one primary shard is not allocated to any node.
```

## Linux
1.  How to check previously run commands were successful or not in the shell?
Ans:

```echo $?```

Explanation:
- If the exit code returns "0" means, previous commands ran successfully.
- If the exit code returns other than "0" means, there were some issues with previously run commands.

2. How to list last 60 day old files in a given directory
Ans:
- We can use find commands to search for files.

Commands:
```
find . -mtime +60 -print

(or)

find DIRECTORY -mtime +60
```

3. We have different files in a directory, out of them 1 file has the word "United" in it. How can we find the file with the word "United".
Ans:
- We can use "grep"
```Ex: grep -rs United *```

4. Explain what are the file permissions in linux
Ans:
- In Linux, there are 3 main types of file permissions: read, write and execute.
- Read: The read permission grants uses the ability to open and read a file. 4
- Write: Write permission allows a user to open and modify or edit the file's contents and save the changes. 2
- Execute: This allows a user to execute or run the file or a program or shell script which is executable. 1

5. How can we check the disk usage in linux server
Ans:
- we can use command `df -h` to find the disk usage in percentages.

6. What is the difference between commands "cp[copy]" and "mv[move]"
Ans:
- Copy: Copying a file to different location
- Move: It is like cut and paste. We can consider it as RENAME.

7. Differences between Softlink and Hardlink?
Ans:
Hardlink:
- Hardlink cannot be created for directories. A hard link can only be created for a file.
- If you remove a original file,  copied file stays.
- Source file and copied file both maintains the same INODE number.
```Usage: ln <SOURCE> <DESTINATION>```

Softlink:
- Symbolic links or symlinks can link to a directory.
- Both source and copied file maintains different INODE Number
- Source file deletes, linked file is no more useful, it losts all the records.
```Usage: ln -s <SOURCE> <DESTINATION>```

8. Any idea on SED in linux, how can we use them
Ans:
sed: Stream editor,
Ex:
Dry run:
```sed 's/Ganesh/Sudheer/g' FILENAME```

Replace a word in a file:
```sed -i 's/Ganesh/Sudheer/g' FILENAME```

9. How to stop a running process in Linux?
To stop a running process, use the kill command followed by the PID of the process.

For example, to stop a process with PID 3836, run the command

kill 3836

10. What is use of top and PS commands
Ans:
top: Will list all the processes with their CPU and Memory usage in linux server with live data.
PS: ps commands lists the all the processes with PID and commands.


## SQL
1. What are Tables and Fields?
Ans:
A table is an organized collection of data stored in the form of rows and columns. Columns can be categorized as vertical and rows as horizontal. The columns in a table are called fields while the rows can be referred to as records.

2. What is a Primary Key?
Ans:
The PRIMARY KEY constraint uniquely identifies each row in a table. It must contain UNIQUE values and has an implicit NOT NULL constraint.

3. What is the difference between Primary key and Unique Key?
Ans:
Both Primary and Unique key carry unique values but the primary key can not have a null value where the Unique key can. And in a table, there cannot be more than one Primary key but unique keys can be multiple.

4. What is an index?
Ans:
- Indexes help speed up searching in the database.
- Indexes are used to find all rows matching with some columns and then to skim through only those subsets of the data to find the matches.

5. Why do we use the FLOOR function in SQL Server?
Ans:
- The FLOOR() function helps us to find the largest integer value to a given number which can be an equal or lesser number.

6. What is the difference between DELETE and TRUNCATE commands?
Ans:
DELETE: This query is used to delete or remove one or more existing tables.

```
The syntax for the DELETE command:

DELETE FROM table_name
[WHERE condition];

Ex:
delete from student where student_name=’Ganesh’
```

TRUNCATE: This statement deletes all the data from inside a table.
```
TRUNCATE TABLE Table_name;

Ex:
truncate table student
```

#### Naresh
A year back I was assigned to a project where Kubernetes and docker are being used. 

I got an opportunity to learn Kubernetes and Docker.

We are using Kubernetes for our microservices and for few infrastructure components that are used for one of the client.

#### Coming to Docker:
- Have a good understanding of docker.
- How to create the images and containers.
- How to clean them, when they are not being used 
- Have good understanding of docker-compose file and docker services.

#### Coming to Kubernetes:
We are using deployment for microservices which are stateless and we are using statefulsets for our database and other Infra components which are stateful applications.
To deploy PODS and services to Kubernetes, we are using two kinds of approaches 
1.  imperative and  
2. declarative Approach.

- We create some YAML files  to deploy the PODS  and services. Also other kubernetes components.

- We maintain our infrastructure code in our GitHub repository. I have a good understating of GitHub branching strategy.
- We use feature branch strategy to commit our changes to gitHub and get the pear approvals and then merge to MASTER branch.

- We recently introduced `Helm` in our environment to package the complete Kubernetes component and deploy. 
- We are using prometheus for our kubernetes resource monitoring.
- We installed prometheus using helm stable charts and created some alert rules in alertmanager to send notifcations to our email and teams.
- When any pod gets creashes due to app issues or OOM issues, we get notifications.
- When we get a notifcations, we start troubleshooting when they get failed and fix them accordigly.

###### DO NOT READ DURING THE CALL: JUST FOR YOUR REFERENCE
#### Useful commands:
- To crete helm chart
```Helm create <reponame>```
- Install helm charts
```Helm install <CHART NAME> <space> <CHARTS>```
- List installed helm charts
```Helm list –kube-context <CLUSTER NAME> -n <NAMESPACE> |grep <PACKAGE NAME>```
- Remove helm package:
```Helm uninstall <PACKAGE NAME> –kube-context <CLUSTER NAME> -n <NAMESPACE>```
- Helm rollback a package:
```helm rollback <RELEASE> [REVISION]```


#### Work notes
- How can we get any helm related changes to a slackChannel
https://github.com/RoadieHQ/kubewise







