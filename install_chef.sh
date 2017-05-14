# http://10.0.2.2/install_chef.sh
# Supports: debian systems only; could be easily modified for other OS package types

DEB=chef_12.17.44-1_amd64.deb
rm -f $DEB
wget "http://10.0.2.2:3000/$DEB"
dpkg -i $DEB
