#!/usr/bin/env bash

##
## Simple couchdb install script for Ubuntu 10.04 LTS.
## Created by Luke Arduini <luke.arduini@me.com>
## 2012-12-07T00:30:31.501Z
##

echo -e 'Installing dependencies...\n'

/usr/bin/apt-get -qq update
/usr/bin/apt-get -qq install build-essential autoconf automake erlang libtool libcurl4-openssl-dev libicu-dev xulrunner-dev

echo -e 'Downloading & extracting couchdb 1.2 source...\n'

/usr/bin/wget -P /usr/local/src http://mirror.cogentco.com/pub/apache/couchdb/releases/1.2.0/apache-couchdb-1.2.0.tar.gz
/bin/tar -xzvf /usr/local/src/apache-couchdb-1.2.0.tar.gz -C /usr/local/src

echo -e 'Running configure script...\n'
cd /usr/local/src/apache-couchdb-1.2.0
./configure --with-js-lib=/usr/lib/xulrunner-devel-1.9.2.28/lib --with-js-inclue=/usr/lib/xulrunner-devel-1.9.2.28/include

echo -e 'Building couchdb...\n'
/usr/bin/make

echo -e 'Installing couchdb...\n'
/usr/bin/make install

echo -e 'Creating user and setting up couchdb permissions...\n'
/usr/sbin/adduser --gecos --disabled-login --disabled-password --no-create-home couchdb
/bin/chown -R couchdb:couchdb /usr/local/var/{log,lib,run}/couchdb
/bin/chown -R couchdb:couchdb /usr/local/etc/couchdb/local.ini

echo -e 'Adding symlink for init script...\n'
/bin/ln -s /usr/local/etc/init.d/couchdb /etc/init.d
/usr/sbin/update-rc.d couchdb defaults

echo -e 'Done \n'