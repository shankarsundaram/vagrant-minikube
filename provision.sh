#!/bin/bash
########################
# Kubectl              #
########################
echo "Installing Kubectl"
sudo apt-get update
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "Installing Kubectl"
kubectl version --client
echo "Installation Complete: Kubectl"
sleep 10
########################
# git                  #
########################
echo "Installing git"
sudo apt-get update
sudo apt install git
git --version
echo "Installation Complete: git"
sleep 10
########################
# Docker               #
########################
echo "Removing previous docker versions if any"
sudo apt-get remove docker docker-engine docker.io containerd runc
echo "Installing docker-ce"
sudo apt-get update
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sleep 5
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
echo "verifying Docker Installation"
sudo docker version
echo "Installation Complete: Docker"
sleep 20
########################
# Minikube             #
########################
echo "Installing Minikube"
sudo apt-get update
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
sudo minikube status
echo "Installation Complete: Minikube"
sleep 10
########################
# Starting Minikube    #
########################
echo "Starting"
sudo minikube start --vm-driver=none
sudo minikube status
sleep 15
########################
# helm                 #
########################
echo "Installing Helm!"
sudo apt-get update
#helm dependency to avoid helm hangs in minikube
sudo apt-get install -y socat 
sudo curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh
sudo helm init
helm search
echo "Installation Complete: Helm"
sleep 10
########################
# Ansible              #
########################
echo "Installing Ansible!"
sudo apt-get update
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
echo "Installation Complete: Ansible"
sleep 10
ansible --version
echo "Your Kube Lab is Ready!"
###################################################
# Author: shankarsundaram                         #
###################################################
