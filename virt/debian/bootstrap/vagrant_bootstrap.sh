apt-get update

# system build libraries
apt-get install build-essentials git

# libvirt support
apt-get install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev

# NFS support
apt-get install nfs-common nfs-kernel-server
# Helpful tools
apt-get install vim tmux reptyr ack-grep inxi wodim
# Install Ruby
apt-get install ruby
gem install bundler
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb -P /tmp/
dpkg -i /tmp/vagrant_1.8.1_x86_64.deb
git clone https://github.com/pradels/vagrant-libvirt.git /tmp/vagrant-libvirt
cd /tmp/vagrant-libvirt
rake2.1 build
vagrant plugin install /tmp/vagrant-libvirt/pkg/vagrant-libvirt-0.0.32.gem
