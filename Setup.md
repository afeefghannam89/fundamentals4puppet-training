# Setup

The original project for these files is the version of [NETWAYS](https://github.com/NETWAYS/fundamentals4puppet-training). All others are forks and might be used to create pull requests and patches.

# Requirements

* Vagrant, recommended version >1.8
* Vagrant plugin vbguest
* Virtualbox
* r10k

On the over hand you can use puppet module install instead of r10k to install all modules in the version described in puppet/environments/production/Puppetfile.

Example for OSX:

    $ sudo vagrant plugin install vagrant-vbguest
    $ sudo gem install r10k

# Setup

    $ cd puppet/environments/production
    $ r10k puppetfile install

# Run

    $ vagrant up --provider virtualbox
