#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

# Création utilisateur packer
useradd -m -s /bin/bash packer
echo "packer:packer" | chpasswd

# Installation fail2ban
apt-get update
apt-get install -y fail2ban

# Crée un fichier de log vide pour sshd afin d'éviter que fail2ban ne se lance pas
touch /var/log/auth.log

# Active fail2ban au démarrage
systemctl enable fail2ban || true
systemctl start fail2ban || true

# Crée un script de démarrage automatique de fail2ban
cat <<'EOF' > /start.sh
#!/bin/bash
service fail2ban start
exec bash
EOF

chmod +x /start.sh