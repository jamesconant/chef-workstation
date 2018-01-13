# http://10.0.2.2/install_chef.sh
# Supports: debian systems only; could be easily modified for other OS package types

DEB=chefdk_2.4.17-1_amd64.deb
rm -f $DEB
wget "http://10.0.2.2:3000/$DEB"
dpkg -i $DEB
