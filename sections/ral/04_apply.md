!SLIDE smbullets small
# Puppet apply

* The Puppet apply command combines master and agent functionality
 * Takes a file containing Puppet code
 * Gathers information using facter
 * Compiles a catalog
 * Enforces the configuration
 * Can also run in simulation mode
* Useful for development and local testing or master-less setups
* Requires root privileges

~~~SECTION:handouts~~~

****

The Puppet apply command combines master and agent functionality which is useful for development
and local testing or master-less setups. 

It takes a file containing Puppet code as input, then gathers information about the system using
facter to compile a catalog and last but not least enforces the configuration. It can also run in
simulation mode which only notifies about required changes instead of enforcing it.

To reduce complexity for now we will start developing Puppet code and use apply to test it and only
move later to a master agent setup.

Running the puppet commands as unprivileged user works as long as you only manage resources the
unprivileged users can access. So typically it will require root privileges because you want to
manage packages, users and so on only root is allowed to manage.

~~~ENDSECTION~~~

