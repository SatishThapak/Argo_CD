# 🚀 Argo CD Setup Guide

## 📌 What Is Argo CD?

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.  
It follows the GitOps paradigm, where the desired state of your application is defined in Git, and Argo CD ensures that your Kubernetes cluster matches this desired state.

This approach empowers teams to manage both infrastructure configuration and application updates from a single, centralized, version-controlled system.

---

## ✨ Key Features

- Manual or automatic deployment of applications to a Kubernetes cluster  
- Automatic synchronization of application state to the current version of declarative configuration  
- Web user interface and command-line interface (CLI)  
- Visualization of deployment issues, detection and remediation of configuration drift  
- Role-based access control (RBAC) for multi-cluster management  
- Single sign-on (SSO) with GitLab, GitHub, Microsoft, OAuth2, OIDC, LinkedIn, LDAP, and SAML 2.0  
- Webhook support for GitLab, GitHub, and BitBucket  

---

## 💡 Why Use Argo CD?

- **Declarative & Versioned**: Store your entire deployment lifecycle in Git—easy to audit, replicate, and roll back  
- **Automation-First**: Eliminate manual errors with consistent, automated deployments  
- **Transparent & Intuitive**: View app status, health, and deployment history via dashboard or CLI  
- **Built for GitOps**: Streamlines modern DevOps practices across environments and clusters  

---

## 🛠️ Prerequisites

Before we begin, ensure you have the following:

1. A running Kubernetes cluster (minikube, EKS, GKE, etc.)
2. kubectl configured to interact with your cluster
3. Basic knowledge of Kubernetes resources$

# Installing ArgoCD on Kubernetes
Let’s start by installing ArgoCD in your Kubernetes cluster. There are two different ways to do this: using manifest files or a Helm chart.

# Step 1: Install ArgoCD
**Method 1:** Using Manifest Files

You can install ArgoCD using the official manifest files provided by the ArgoCD team.
> kubectl create namespace argocd
> kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

