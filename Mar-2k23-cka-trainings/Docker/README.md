- Run "docker build -t demo-nginx-ubuntu:1.0 ."
- Run "kubectl run nginx-test --image=demo-nginx-ubuntu:1.0 -n demo --image-pull-policy=IfNotPresent"