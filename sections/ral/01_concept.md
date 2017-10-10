!SLIDE smbullets small
# Puppet Concept

* Puppet is about abstraction
* Domain Specific Language allows for an abstract description of resources
 * Infrastructure as Code
 * Executable Documentation
* Define the desired state and not how to get there 
 * Idempotence

~~~SECTION:handouts~~~

****

Puppet is all about abstraction. It defines its own Domain Specific Language which allows
for an abstract description of resources. This tries to be as human readable as possible
so typically getting a basic understanding of Puppet code is possible without further 
knowledge in Puppet because of this it is often referenced as "Executable Documentation".
Another term often used is "Infrastructure as Code" referring to code being always the best
documentation and Puppet code can manage the complete infrastructure.

A terminology from mathematics or computer science called "Idempotence" is also often used
meaning for Puppet that Puppet Code can be applied multiple times without further changing
the result beyond the initial application. This is done by only defining the desired state
and Puppet will determine internally how to get to this state. 

~~~ENDSECTION~~~
