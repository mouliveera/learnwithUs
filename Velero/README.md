# Velero Installation Guide

This guide provides step-by-step instructions for setting up Velero on your local Minikube cluster, using Minio as the storage backend.

## Step 1: Start Minikube

Ensure that Minikube is running on your local machine.

```bash
minikube status
```

## Step 2: Create Velero Namespace

Create the Velero namespace in your Minikube cluster.

```bash
kubectl create ns velero
```

## Step 3: Deploy Minio Resources to Velero Namespace

Deploy the necessary Minio resources to the Velero namespace.

```bash
kubectl apply -f . -n velero
```

## Step 4: Install Velero

You can choose between using the `velero install` command or Helm charts for the installation. Below are both options:

### Option 1: Velero Install Command

Use the following `velero install` command to install Velero with Minio as the storage backend.

```bash
velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.2.1 \
    --bucket velero \
    --secret-file ./credentials-velero \
    --use-volume-snapshots=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://minio.velero.svc:9000
```

### Option 2: Helm Install

Add the Velero Helm chart repository to your local Helm.

```bash
helm repo add vmware-tanzu https://vmware-tanzu.github.io/helm-charts
```

Install Velero using Helm charts with a custom values file.

```bash
helm install velero vmware-tanzu/velero -n velero -f dev-minio-values.yaml
```

### Helm Install Result

After the Helm installation, you should see a deployment confirmation.

```bash
helm install velero vmware-tanzu/velero -n velero -f dev-minio-values.yaml
```

Check the status of the deployment.

```bash
kubectl get deployment/velero -n velero
```

Ensure that the secret has been created.

```bash
kubectl get secret/velero -n velero
```

## Step 5: Verify Installation

After the installation is complete, check that Velero is up and running.

```bash
kubectl get deployment/velero -n velero
```

Additionally, you can follow the instructions provided in the Helm result to download the Velero client and get more information from the [official Velero documentation](https://velero.io/docs).
