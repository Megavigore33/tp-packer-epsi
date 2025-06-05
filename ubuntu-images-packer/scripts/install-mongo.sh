#!/bin/bash
set -e

# Empêche tous les prompts interactifs
export DEBIAN_FRONTEND=noninteractive

# Mise à jour des dépôts
apt-get update

# Installation du fuseau horaire et dépendances de base
apt-get install -y tzdata curl gnupg lsb-release ca-certificates

# Configuration silencieuse du fuseau horaire
ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Ajout de la clé MongoDB
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-6.0.gpg

# Ajout du dépôt MongoDB 6.0
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Mise à jour et installation de MongoDB
apt-get update
apt-get install -y mongodb-org
