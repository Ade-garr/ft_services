### Welcome to my ft_services [multi-service cluster] repository 👋

⭐️ The goal of this subject was to discover Kubernetes and set up a cluster with several simple services (Wordpress, Phpmyadmin, Nginx, MySQL, Grafana, InfluxDB, FTPS server). Each service runs in a dedicated container built under Linux Alpine.

## ✅ __Features__ ⤵️
- A Kubernetes web __dashboard__
- A __Load Balancer__ with a single ip which manages the external access of the services. It is the only entry point to the cluster
- A __WordPress website__ listening on port 5050, which works with a __MySQL database__. Both services run in separate containers. Wordpress has its own nginx server. 
- __phpMyAdmin__, listening on port 5000 and linked with the MySQL database. it has its own nginx server. 
- A container with an __nginx server__ listening on ports 80 and 443. Port 80 is in http and is a systematic redirection of type 301 to 443, which is in https.
- A __FTPS server__ listening on port 21.
- A __Grafana platform__, listening on port 3000, linked with an __InfluxDB database__. Grafana is monitoring all the containers. 

## 💡 Usage

You first need to install minikube on your system ! Please refer to documentation : <br>
https://kubernetes.io/fr/docs/tasks/tools/install-minikube/

Then simply :

```
./setup.sh
```

You can now browser through your different services.<br>

⚠️ Subject given slightly differs from actual project.<br>
⚠️ Project realized for learning purposes, it may contain bad practices, do not use for professional purposes.