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
docker build -t nginx ./srcs/nginx #CHANGER LES REDIRECTIONS DE LA CONF NGINX + reverse
kubectl apply -f nginx.yaml

# mySQL
docker build -t mysql ./srcs/mySQL
kubectl apply -f mySQL.yaml

# phpMyAdmin
docker build -t phpmyadmin ./srcs/phpMyAdmin #CHANGER LES REDIRECTIONS DE LA CONF NGINX + reverse
kubectl apply -f phpMyAdmin.yaml

# UPDATER UN CONTAINER
kubectl delete deployment.apps/mysql-deployment && kubectl delete service/mysql && docker build -t mysql ./srcs/mySQL && kubectl apply -f mySQL.yaml
kubectl delete deployment.apps/nginx-deployment && kubectl delete service/nginx && docker build -t nginx ./srcs/nginx && kubectl apply -f nginx.yaml
kubectl delete deployment.apps/phpmyadmin-deployment && kubectl delete service/phpmyadmin && docker build -t phpmyadmin ./srcs/phpMyAdmin && kubectl apply -f phpMyAdmin.yaml
