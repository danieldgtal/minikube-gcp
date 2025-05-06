### 📜 `01-setup/install-minikube.sh`


#!/bin/bash

set -e

echo "Updating system..."
sudo apt-get update -y
sudo apt-get install -y curl apt-transport-https docker.io conntrack

echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

echo "Installing minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

echo "Configuring Docker permissions..."
sudo usermod -aG docker $USER
newgrp docker

echo "Starting minikube..."
minikube start --driver=docker

echo "Checking cluster status..."
kubectl get nodes

echo "✅ Minikube installation completed!"

