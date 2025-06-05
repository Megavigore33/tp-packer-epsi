#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# Prépare le fuseau horaire
apt-get update
apt-get install -y tzdata curl ca-certificates gnupg lsb-release
ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Installe nginx
apt-get install -y nginx