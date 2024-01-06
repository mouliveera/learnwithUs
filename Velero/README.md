# Velero Setup with Minikube and Minio

This guide provides step-by-step instructions for setting up Velero with Minikube and Minio, enabling you to store backups in a local Minio instance.

## 1. Start Minikube in your Local Environment

Ensure Minikube is running by checking its status:

```bash
minikube status
```

## 2. Create Velero Namespace

Create the Velero namespace using the following command:

```bash
kubectl create ns velero
```

## 3. Deploy Minio Resources to Velero Namespace

Deploy the necessary Minio resources to the Velero namespace:

```bash
kubectl apply -f . -n velero
```

## 4. Install Velero

### 4.1 Velero Install

Use the `velero install` command to set up Velero:

```bash
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.2.1 \
    --bucket velero \
    --secret-file ./credentials-velero \
    --use-volume-snapshots=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000
```

### 4.2 Helm Install

1. Add the Velero Helm chart repository:

```bash
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
```

2. Create a `dev-minio-values.yaml` file with the following content:

```yaml
configuration:
  backupStorageLocation:
  - bucket: velero
    name: velero
    provider: aws
    prefix: backups
    default: true
    config:
      region: minio
      s3ForcePathStyle: true
      s3Url: http://minio.velero.svc:9000
  volumeSnapshotLocation:
  - config:
      region: minio
      s3ForcePathStyle: true
      s3Url: http://minio.velero.svc:9000
    provider: aws
initContainers:
- name: velero-plugin-for-aws
  image: velero/velero-plugin-for-aws:v1.8.1
  volumeMounts:
  - mountPath: /target
    name: plugins
credentials:
  useSecret: true
  secretContents:
    cloud: credentials-velero
```

3. Install Velero using Helm charts and the customized values file:

```bash
helm install velero vmware-tanzu/velero -n velero -f dev-minio-values.yaml
```

### 4.3 Helm Install Result

After Helm installation, you should see a result similar to:

```bash
helm install velero vmware-tanzu/velero -n velero -f dev-minio-values.yaml
```

Check that Velero is up and running:

```bash
kubectl get deployment/velero -n velero
```

Ensure the secret has been created:

```bash
kubectl get secret/velero -n velero
```

Once Velero server is running, obtain the Velero client:

1. Download the Velero client:

```bash
wget https://github.com/vmware-tanzu/velero/releases/download/v1.12.2/velero-v1.12.2-darwin-amd64.tar.gz
```

2. Extract the Velero client:

```bash
tar -xvf velero-v1.12.2-darwin-amd64.tar.gz -C velero-client
```

Refer to the official Velero documentation for more information: [Velero Documentation](https://velero.io/docs)
