CouchDB Installation Scripts
===========================

Intended to be a collection of no hassle scripts for installing CouchDB from source.

These scripts have been tested on fresh x86_64 architecture installs of the following OS releases:

* Debian Squeeze / 6.0
* Ubuntu 10.04 LTS

###Current scripts


#### Debian Squeeze / 6.0

Usage:

* `chmod +x install_couch_debian6.sh`
* `./install_couch_debian6.sh`
* Relax.


#### Ubuntu 10.04 LTS

Usage:

* `chmod +x install_couch_ubuntu10.04.sh`
* `./install_couch_ubuntu10.04.sh`
* Relax.

Note: there are many public [CouchDB related PPAs](https://launchpad.net/ubuntu/+ppas?name_filter=couchdb)
for Ubuntu that you may be interested in using *instead* of building from source. However, 
I have not personally tested these and cannot vouch for them.


##### Addendum
On both Ubuntu and Debian, you may want to run the script in a `screen` if you're doing it over ssh:
* `apt-get update; apt-get install screen`
* `screen`

Depending on your system, the dependency installation step may take a while.