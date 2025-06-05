#!/bin/bash
set -e

# Empêche tous les prompts interactifs
export DEBIAN_FRONTEND=noninteractive

# Prépare le fuseau horaire
apt-get update
apt-get install -y tzdata curl ca-certificates gnupg lsb-release
ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Ajoute le dépôt Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Installe Node.js
apt-get install -y nodejs
