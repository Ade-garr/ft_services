# si VM vierge, pour regler les problemes de permission
#sudo usermod -aG docker user42; newgrp docker

# demarrage
minikube delete
minikube start --vm-driver=docker

# paramétrage du docker
eval $(minikube docker-env)

# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
### On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metalLB.yaml 

# NGINX
docker build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx.yaml

# mySQL
docker build -t mysql ./srcs/mySQL
kubectl apply -f ./srcs/mySQL.yaml

# phpMyAdmin
docker build -t phpmyadmin ./srcs/phpMyAdmin
kubectl apply -f ./srcs/phpMyAdmin.yaml

# Wordpress
docker build -t wordpress ./srcs/WordPress
kubectl apply -f ./srcs/WordPress.yaml

# InfluxDB
docker build -t influxdb ./srcs/InfluxDB
kubectl apply -f ./srcs/InfluxDB.yaml

# Grafana
docker build -t grafana ./srcs/Grafana
kubectl apply -f ./srcs/Grafana.yaml

# FTPS
docker build -t ftps ./srcs/FTPS
kubectl apply -f ./srcs/FTPS.yaml

# Dashboard
minikube dashboard

# UPDATER UN CONTAINER
#kubectl delete deployment.apps/mysql-deployment && kubectl delete service/mysql && docker build -t mysql ./srcs/mySQL && kubectl apply -f mySQL.yaml
#kubectl delete deployment.apps/nginx-deployment && kubectl delete service/nginx && docker build -t nginx ./srcs/nginx && kubectl apply -f nginx.yaml
#kubectl delete deployment.apps/phpmyadmin-deployment && kubectl delete service/phpmyadmin && docker build -t phpmyadmin ./srcs/phpMyAdmin && kubectl apply -f phpMyAdmin.yaml
#kubectl delete deployment.apps/wordpress-deployment && kubectl delete service/wordpress && docker build -t wordpress ./srcs/WordPress && kubectl apply -f WordPress.yaml
#kubectl delete deployment.apps/grafana-deployment && kubectl delete service/grafana && docker build -t grafana ./srcs/Grafana && kubectl apply -f Grafana.yaml
#kubectl delete deployment.apps/influxdb-deployment && kubectl delete service/influxdb && docker build -t influxdb ./srcs/InfluxDB && kubectl apply -f InfluxDB.yaml
#kubectl delete deployment.apps/ftps-deployment && kubectl delete service/ftps && docker build -t ftps ./srcs/FTPS && kubectl apply -f FTPS.yaml