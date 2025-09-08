📌 What Is Argo CD?

ArgoCD is a declarative, GitOps continuous delivery tool for Kubernetes. 
It follows the GitOps paradigm, where the desired state of your application is defined in Git, and ArgoCD ensures that your Kubernetes cluster matches this desired state

This approach empowers teams to manage both infrastructure configuration and application updates from a single, centralized, version-controlled system.

✨ Key Features

1. Manual or automatic deployment of applications to a Kubernetes cluster.
2. Automatic synchronization of application state to the current version of declarative configuration.
3. Web user interface and command-line interface (CLI).
4. Ability to visualize deployment issues, detect and remediate configuration drift.
5. Role-based access control (RBAC) enabling multi-cluster management.
6. Single sign-on (SSO) with providers such as GitLab, GitHub, Microsoft, OAuth2,  OIDC, LinkedIn, LDAP, and SAML 2.0
7. Support for webhooks triggering actions in GitLab, GitHub, and BitBucket.



💡 Why Use Argo CD?

1. Declarative & Versioned: Store your entire deployment lifecycle in Git—making it easy to audit, replicate, and roll back changes.
2. Automation-First: Eliminate manual errors with consistent, automated deployments.
3. Transparent & Intuitive: View app status, health, and deployment history using a user-friendly dashboard or CLI.
4. Built for GitOps: Streamlines modern DevOps practices, especially for multi-environment or multi-cluster setups.



## Install Minikube and create a local Kubernetes cluster. 

## Docker will be installed for containerization, and kubectl will be used to manage the cluster.

sudo apt  install docker.io -y
sudo docker run hello-world
sudo snap install kubectl

Run the following command to download Minikube:
# curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

minikube start --driver=docker
kubectl get nodes
minikube addons enable ingress

docker login

// Create docker image in the same dir where your dockerfile available.

docker build -t my_argocd_image/node-app:latest .    
docker tag my_argocd_image/node-app:latest satishthapak/node-app:latest
docker push satishthapak/node-app:latest
docker pull satishthapak/node-app


Create an ArgoCD namespace
# kubectl create namespace argocd

# Run this command to install ArgoCD

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Get pods in the ArgoCD namespace

kubectl get pods -n argocd

# Expose ArgoCD Server

kubectl port-forward --address 0.0.0.0 svc/argocd-server 8080:443 -n argocd

# Get the ArgoCD password

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d && echo

Use passwords to log in to the ArgoCD dashboard

Configure Repository in ArgoCD UI
1. Go to Settings → Repositories → Connect Repo
2. Connection Method: HTTPS
3. Type: Git
4. Project: default
5. Repository URL: [Paste your repo URL]
6. Username / Password: (Optional, use if private repo)
7. Leave the rest as default and click Connect

## Create a New Application in ArgoCD UI
1. Navigate to Applications → New App
2. Application Name: argocd-github-actions
3. Project: default
4. Sync Policy: Automatic

Enable Prune Resources
Enable Self-Heal

5. Repo URL: Select the one you just connected to
6. Revision: main
7. Path: manifest (folder in the repo containing Kubernetes YAMLs)
8. Cluster URL: Select https://kubernetes.default.svc
9. Namespace: argocd
9. Leave other settings as default or customize as needed, then click Create

After successfully configuring ArgoCD, we can now proceed to update the final part of our workflow code

