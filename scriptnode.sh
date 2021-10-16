#!/bin/bash
echo "========== script to install Kubernetes Master with Docker engine =========="

echo "========== Ugprade =========="
sudo apt upgrade -y
echo "========== Ugdate =========="
sudo apt update

echo "========== Docker Installation Script =========="
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker $user

echo "========== The kubelet integrates with Docker through the built-in dockershim CRI implementation =========="
sudo mkdir /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

echo "========== enabling and restarting docker service =========="
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "========== Kubernetes installation =========="
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

rm get-docker.sh .script.sh