#!/bin/bash
timedatectl set-timezone UTC
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
apt-get install -yqq python python3
# setup default admin user accounts
# setup user 'terraform'
useradd -s /bin/bash -m terraform  ; echo -e "pass@123\npass@123" | passwd terraform | usermod -a -G sudo terraform
echo 'terraform  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
mkdir -p /home/terraform/.ssh
chown terraform:terraform /home/terraform/.ssh
chmod 0700 /home/terraform/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQCm7QKQUAa5vgGaypmMSvuRbmWz4Nm7va6TNXTiuo7XMU6K5OSL8/PNhbc56SJQZ64/n28dSuFa2/8Mi9488NjLoEOPjItbvZBS0Zi4OhaSxxPdMwxfNhcgluNJzaChvc72uIzvQTTzdlA0Ix7RveLXv4PLryu091oMFRnatYg7SylCk6J+Zm/sYoCFU/M02QwPRAC98qtJ5PrvPCSMdXelDWrPKqfH1aiDuLQIj02M99Un3CyZlarNfpeVisGnWS849tXYnN4te3nfO8Ps0Ag7mnZ0F9uM57bknkb8yOKOdPC/XlMGPLNbemqbh2sDqTzdwvnOTH+F0RE/IybYSF" > /home/terraform/.ssh/authorized_keys
chmod 0644 /home/ubuntu/.ssh/authorized_keys
