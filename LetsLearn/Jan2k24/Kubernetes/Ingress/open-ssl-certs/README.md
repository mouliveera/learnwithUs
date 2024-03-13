## Create selfSigned certs
```
❯ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout my-minikube-colors-tls.key -out my-minikube-colors-tls.crt
.+.+......+.....+.+.........+...+++++++++++++++++++++++++++++++++++++++*...+..+...+............+....+.....+...+++++++++++++++++++++++++++++++++++++++*...+.....+......+.......+..+.+.....+.......+.........+......+........+............+...+....+..+...+.......+...+........+...+.+........+.+.........+..+.+..+................+..+...+.+...+...............+..+.........+....+..+....+..+....+...........+....+...+...+..+.+..+.......+......+...........+.+...+.....+.........+.......+.........+............+..............+......+.......+...+..............+.+........+.+.....+.+...+......+...........+.......+..+.............+........+............+...+.......+.....+...+....+...+......+......+........+...+....+...+........+...+.......+.....+.........+....+.........+..+...+.+..............++++++
......+........+.+.....+....+..+..........+..+..........+........+...............+.......+++++++++++++++++++++++++++++++++++++++*....+...+.+..+.............+..+...+..........+......+........+.+++++++++++++++++++++++++++++++++++++++*.+...+..+...+....+...+.....+...+............+.+.........+.....+......+.+.....++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:IN
State or Province Name (full name) [Some-State]:TS
Locality Name (eg, city) []:SEC
Organization Name (eg, company) [Internet Widgits Pty Ltd]:letsLearn.com
Organizational Unit Name (eg, section) []:devOps
Common Name (e.g. server FQDN or YOUR name) []:my-minikube-colors.com
Email Address []:mouli@gmail.com
```

## Use those certs and key to create K8s secret
```
❯ kubectl create secret tls my-minikube-colors-tls \
    --namespace demo \
    --key my-minikube-colors-tls.key \
    --cert my-minikube-colors-tls.crt
secret/my-minikube-colors-tls created
```

## Add tls block at ingress yaml
```
tls:
  - hosts:
    - my-minikube-colors.com
    secretName: my-minikube-colors-tls
```
