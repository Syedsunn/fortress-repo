# FTP Service Deployment on Kubernetes with VSFTPD

This repository provides a solution for deploying an FTP service within a Docker container, and then deploying it on a Kubernetes cluster using VSFTPD. The solution follows best practices for containerization and Kubernetes deployment.

## Prerequisites

Before deploying the FTP service, make sure you have the following prerequisites set up in your environment:

1. Docker: Ensure that Docker is installed and set up on your local development environment.

2. Kubernetes: Have a Kubernetes cluster (e.g., Amazon EKS) available and configured for deployment.

## Getting Started

Follow the steps below to deploy the FTP service within a container and deploy it on a Kubernetes cluster:

1. **Create a Docker Image for VSFTPD**:
   - Clone this repository.
   - Review the `Dockerfile` and accompanying scripts provided.
   - Build the Docker image:
     ```bash
     docker build -t fortress-ftp-image .
     ```

2. **Kubernetes Deployment**:
   - Review the `ftp-deployment.yaml` file for Kubernetes deployment.
   - Ensure you have `kubectl` configured to connect to your Kubernetes cluster.
   - Deploy the FTP service on Kubernetes:
     ```bash
     kubectl apply -f ftp-deployment.yaml
     ```

3. **Accessing the FTP Service**:
   - Once the deployment is complete, use `kubectl port-forward` to map a local port to the FTP service within the pod:
     ```bash
     kubectl port-forward <pod-name> 2100:21
     ```
     Replace `<pod-name>` with the name of the pod.

   - You can now access the FTP service locally using your preferred FTP client and connecting to `localhost` or `127.0.0.1` on port 2100.

## Configuration

### VSFTPD Configuration

The `vsftpd.conf` file contains the VSFTPD server configuration, including FTP-related settings.

### User List

By default, all users can access the FTP service. If you need to restrict access, you can create a `user_list` file and configure VSFTPD to use it.

### User List Configuration

To restrict access to specific users, create a `user_list` file with usernames that are allowed or denied access. For example:

```plaintext
# Allow these users
allowed_user1
allowed_user2

# Deny these users
denied_user1
denied_user2