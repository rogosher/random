#!/bin/bash

cd /tmp

wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update

sudo apt-get install puppet

sudo apt-get update
sudo puppet resource package puppet ensure=latest
