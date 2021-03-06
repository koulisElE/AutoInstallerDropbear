cd

#Updating the system & installing wget + curl
apt-get update;apt-get -y install wget nano unzip unrar curl
apt-get install htop

# setting port ssh
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 444' /etc/ssh/sshd_config
service ssh restart

#install dropbear ssh
apt-get -y install dropbear ssh

# enable the dropbear 
sed -i 's/NO_START\=1/NO_START\=0/g' /etc/default/dropbear

# default port for dropbear
sed -i 's/DROPBEAR_PORT\=22/DROPBEAR_PORT\=442/g' /etc/default/dropbear

# some extra ports for dropbear (444,443,442,80,8080,8484,143 or whatever you like)
sed -i 's/DROPBEAR_EXTRA_ARGS\=/DROPBEAR_EXTRA_ARGS\=\"\-p 143 \-p 80 \-p 8080 \-p 8484 \-p 444 \-p 443\"/g' /etc/default/dropbear

service dropbear start
service sshd restart

