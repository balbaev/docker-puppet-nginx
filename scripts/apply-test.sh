#!/bin/sh
apt-get update
apt-get install wget -y
wget https://apt.puppetlabs.com/puppet-release-bionic.deb
dpkg -i puppet-release-bionic.deb
apt-get update
apt-get install puppet-agent -y
/opt/puppetlabs/bin/puppet agent -t
