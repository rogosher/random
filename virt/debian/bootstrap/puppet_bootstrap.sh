#!/bin/bash

cd /tmp

wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update

rm puppetlabs-release-trusty.deb
apt-get update

puppet resource package puppet ensure=latest
