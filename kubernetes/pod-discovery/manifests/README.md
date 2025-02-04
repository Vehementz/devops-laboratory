### Web pod - Apache-Nginx

Here’s an enhanced version of the README.md based on your description:
Web Pod with Apache and Nginx

This Kubernetes configuration sets up a Pod containing two containers:

Apache HTTP Server (httpd): A web server that listens on port 8080.
Nginx: A reverse proxy that forwards requests to the Apache server on port 8080.

The Nginx container listens on port 80 and redirects incoming traffic to the Apache server running on port 8080. This setup allows you to expose the web application on your local machine for testing purposes.
Prerequisites

Before using this setup, ensure that you have the following:

A Kubernetes cluster (e.g., using kind for local development).
kubectl configured to interact with your cluster.

Overview of the Setup
#### Apache Container

Image: httpd:latest
Listening on: 8080
Function: Serves web content.

#### Nginx Container

Image: nginx:latest
Listening on: 80
Function: Acts as a reverse proxy, forwarding HTTP requests from port 80 to Apache running on port 8080.

Volume Setup

The two containers share an EmptyDir volume that holds the web content. Both containers mount this volume to serve content to the users.
Deployment
Pod Configuration

A Kubernetes Pod is configured with two containers:


The Apache container listens on port 8080.
The Nginx container listens on port 80 and forwards requests to Apache.


Accessing the Application

To test the application locally, you need to forward the ports using kubectl port-forward. This will make the Apache server available on your local machine at http://localhost:8080.
Port Forward Command

To expose the application locally, run the following command:
```
kubectl port-forward pod/web-pod 8080:8080
```
This will forward port 8080 of the Apache container inside the Pod to localhost:8080 on your machine. Once the command runs successfully, you can open your browser and access the application by navigating to:

http://localhost:8080

Troubleshooting
1. Pod Not Running

If you find that the Pod is in CrashLoopBackOff, you can troubleshoot using:
```
kubectl describe pod web-pod
```
Check for errors in the container logs, such as misconfigurations or missing files.
2. Apache Not Listening on 8080

Make sure the Apache container is listening correctly on port 8080. You can check the logs with:
```
kubectl logs web-pod -c apache-container
```
If there are issues, ensure that Apache is bound to 0.0.0.0:8080 (or at least 8080 on the correct interface).
3. Nginx Not Forwarding Requests

Ensure the Nginx configuration is set up properly to forward requests to Apache. If there are issues, check the Nginx logs:
```
kubectl logs web-pod -c nginx-container
```