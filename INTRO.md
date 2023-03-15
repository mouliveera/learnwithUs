## SELF INTRO:

- Hello, My name is Mouli.
- Currently i am playing a role as Lead devops Engineer at Reputation and resposible for entire technical operations.

- I was the first devops team member at Reputation India office and i was solely responsible for all the cloud operations and other devops related issues. Now i lead a team of 8 member.

- Our team is responsible to manage dfferent techinical functions like devOps, CloudEngineering, SRE and Release management.

- I am directly reporting to Devops director here and I do soft manage the team.

- In total i have over 10+ years of experince, which include SRE and Linux administrator roles that i worked in my previous organisations.

- I am good at and  using top trending technoligies like Kubernetes, Helm, prometheus, NewRelic, ElasticSearch, MongoDb, Redis administration  in our current role.

- I deal the migration and version upgrade for database applications which large dataVolumes around +3T disks on Databses like elasticsearch and Mongodb with monimal downtime.

- I show more interest to automate things which are not automated.

- I love to do POC's of new opensource devops tools, which gives good exposer on tools and helps our team to provide better support to Devs.

- I have an experience n doing adHoc and planned activities based the on the criticality.

------
#### Reputation:
- When i joined Reputations things in devops are UNstructured. It a FRESH team at India office and now we are 8. Managing functions like Devops , CloudEngineering and SRE.
- Our platform is on GCP and We have different MicroServices to support our platform.
- We deployed our microServices on GKE. We use Jenkins CI/CD for our microService deployments.
- We are using HELM to packages our MicroServices to be deployed as different K8s resources.
- All manage our infrastructure as code and store it GitHub.
- We follow feature branch strategy to deploy any new change to PRODUCTION.
- We perform month SOCs audits and Infra audits to check if something get missed from our Monitoring RADAR and nuke them to secure and save some $$.
- We monitor our infrastucture usng Prometheus and Grafana.
- We do use SUMOLOGIC and Newrelic.
- We have Mongo and ES DB's.
- We mange queues health and notify dev's if we notice any usual activities on redis and RabbitMQ in our infra. 

---
#### CI/CD
- CI/CD: It automates much or all of manaual human intervenction traditionally needed get new code from commit into production such as build, test and deploy. As well as infrastucture provisioning.

- CI: Continuous integration is the practice of integrating all your code changes into the main branch of a shared source code repository early and often.

- CD: Continuous delivery is a software development practice that works in conjunction with continuous integration to automate the infrastructure provisioning and application release process.

- Continuous delivery can cover everything from provisioning the infrastructure to deploying the application to the testing or production environment.

- Continuous deployment: You can deploy the build code to PROD anytime

---
#### Jenkins Pipeline Ex:
```
pipeline {
	agent any or labels
	triggers

    parameters {

    }

    stages {
    	stage("Init") {
    	git url: 'https://github.com/jfrogdev/project-examples.git'
    	}
    	
    	}
    }
 }   
 ```

PROD-US: Apply zone topology limitations on all ES7 clusters
Jira: https://reputation.atlassian.net/browse/OPS-16959

Doc: https://reputation.atlassian.net/wiki/spaces/ENG/pages/2531950654/Apply+zone+topology+limitations+on+all+ES7+clusters

Run the below test cases after the changes:
Jyothi will share the list.