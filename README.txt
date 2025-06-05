README TP PACKER

Pour construire les images dockers des 3 services dont on a besoin, il faut se placer dans le répertoire "ubuntu-images-packer" et exécuter les commandes suivantes :

packer build mongo.pkr.hcl
packer build node.pkr.hcl
packer build nginx.pkr.hcl

Cela va fournir 3 hash qu'il faudra conserver.



Pour lancer les services via docker :

docker run -it --rm sha256:<le hash de l'image> bash



Pour lancer NginX ou Mongo avec quelques options au démarrage, on peut modifier les commandes :

docker run -d --name mongo-test -p 27017:27017 sha256:<le hash de l'image mongo> mongod --bind_ip_all
docker run -d --name nginx-test -p 80:80 sha256:<le hash de l'image nginx>




Précision : 

Fail2Ban est bien installé sur les containers mais je n'arrive pas à le faire se lancer automatiquement au démarrage.