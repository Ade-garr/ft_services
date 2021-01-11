# si VM vierge, pour regler les problemes de permission
sudo usermod -aG docker user42; newgrp doker
# obtenir l'IP de minikube
kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p

# demarrage
service nginx stop
minikube delete
minikube start

# paramétrage du docker
eval $(minikube docker-env)

# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
### On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metalLB.yaml 

# NGINX
docker build -t nginx ./srcs/Nginx #CHANGER LES REDIRECTIONS DE LA CONF NGINX
kubectl apply -f nginx.yaml

# phpMyAdmin
