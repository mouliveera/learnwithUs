## Setup MongoDB replication
- We are creating a headless service
- We are creating mongodb replicasets of 3 pods.
```
k apply -f  mongodb-statefulset.yaml
k apply -f  mongodb-service.yaml
```
#### mongoConsol
- Once you login to the pod and then to mongo console. We cannot see the replications as we have not set it yet.
```
kubectl exec -it mongod-0 -n mongo -- mongo
> rs.status()
{
	"ok" : 0,
	"errmsg" : "no replset config has been received",
	"code" : 94,
	"codeName" : "NotYetInitialized"
}
> show dbs;
uncaught exception: Error: listDatabases failed:{
	"topologyVersion" : {
		"processId" : ObjectId("62cea2cfc1a8ebb700adf95a"),
		"counter" : NumberLong(0)
	},
	"ok" : 0,
	"errmsg" : "not master and slaveOk=false",
	"code" : 13435,
	"codeName" : "NotPrimaryNoSecondaryOk"
}
```
- We need to initiated the mongoReplication first.
```
> rs.initiate()
{
	"info2" : "no configuration specified. Using a default configuration for the set",
	"me" : "mongod-0:27017",
	"ok" : 1
}
```
- Check the replication now.
```
rs0:SECONDARY> rs.status()
rs0:PRIMARY> rs.conf().members
[
	{
		"_id" : 0,
		"host" : "mongod-0:27017",
		"arbiterOnly" : false,
		"buildIndexes" : true,
		"hidden" : false,
		"priority" : 1,
		"tags" : {

		},
		"secondaryDelaySecs" : NumberLong(0),
		"votes" : 1
	}
]
```

- Add a first member to replicationSet [podName.serviceName:Port]
```
rs0:PRIMARY> rs.conf().members[0].host="mongod-0.mongo:27017"
```
- Once you add the member to cluster, reconfigure the replicaset.
```
rs0:PRIMARY> var cfg = rs.conf()
rs0:PRIMARY> rs.reconfig(cfg)
```
- Add other members to replicaSet
```
rs0:PRIMARY> rs.add("mongod-1.mongo:27017")
rs0:PRIMARY> rs.add("mongod-2.mongo:27017")
```
- Check the replicaStatus, you will see one primary and 2 secondaries.
```
rs0:PRIMARY> rs.status()
```
- Check "syncSourceHost" in above result. It gives you how the SYNC is in progress.

- Login to secondary mongo.
- if you observe below errors, while running show db or collections commands.
```
rs0:SECONDARY> show dbs;
uncaught exception: Error: listDatabases failed:{
	"topologyVersion" : {
		"processId" : ObjectId("62ceb1ec88be7cfafd7d4394"),
		"counter" : NumberLong(6)
	},
	"ok" : 0,
	"errmsg" : "not master and slaveOk=false",
	"code" : 13435,
	"codeName" : "NotPrimaryNoSecondaryOk",
	"$clusterTime" : {
		"clusterTime" : Timestamp(1657713906, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	},
	"operationTime" : Timestamp(1657713906, 1)
} :
_getErrorWithCode@src/mongo/shell/utils.js:25:13
Mongo.prototype.getDBs/<@src/mongo/shell/mongo.js:145:19
Mongo.prototype.getDBs@src/mongo/shell/mongo.js:97:12
shellHelper.show@src/mongo/shell/utils.js:956:13
shellHelper@src/mongo/shell/utils.js:838:15
@(shellhelp2):1:1
```
- RUN THESE COMMANDS IN MONGO CONSOL TO FIX THE ISUES.
```
rs0:SECONDARY> rs.secondaryOk()
```
---
```
rs0:SECONDARY> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
```
#### How to verify the replication.
- Login to the PRIMARY pod.
```
kubectl exec -it mongo-0 -- mongo
```
- Create collection.
```
rs0:PRIMARY> db
test
rs0:PRIMARY> show collections
rs0:PRIMARY> db.createCollection("helloWorld")
{
        "ok" : 1,
        "$clusterTime" : {
                "clusterTime" : Timestamp(1657714430, 1),
                "signature" : {
                        "hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
                        "keyId" : NumberLong(0)
                }
        },
        "operationTime" : Timestamp(1657714430, 1)
}
rs0:PRIMARY> show collections
helloWorld
```

- Login to the secondary pods and verify the replication.
```
kubectl exec -it mongo-1 -- mongo
```
- Check the replication
```
rs0:SECONDARY> db;
test
rs0:SECONDARY> show dbs;
admin   0.000GB
config  0.000GB
local   0.000GB
test    0.000GB
rs0:SECONDARY> show collections
helloWorld
```