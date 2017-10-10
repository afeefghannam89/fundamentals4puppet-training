!SLIDE smbullets small
# Configuration management

* Definition:

*Configuration management is a systems engineering process for establishing and maintaining consistency of a
product performance, functional, and physical attributes with its requirements, design and operational
information throughout its life.*

~~~SECTION:handouts~~~

****

Wikipedia defines configuration management as a *systems engineering process for establishing and maintaining consistency of a
product's performance, functional, and physical attributes with its requirements, design and operational information throughout
its life.*

So configuration management software is used to describe a desired state, configure a system to be in this state and recognize
drifts from this state to revert them.

~~~ENDSECTION~~~

!SLIDE smbullets small
# Legacy configuration management

* Manual configuration
* Golden images
* Custom one-off scripts
* Software packages

~~~SECTION:handouts~~~

****

There has always been some type of configuration management but all solutions not designed for it have some shortcomes.

## Manual configuration

This approach means literally to log in manually in every system and repeat the same configuration change which will
not scale and realistically always create some drift.

~~~PAGEBREAK~~~

## Golden images

Using one template to create a new node will result in a consistent installation but keeping this consistency over different
versions of this image is difficult. Difficulty will grow with the number of images need for different environments, projects,
tools and roles.

## Custom one-off scripts

Script written to solve one problem will be difficult to reuse for other requirements. Also rerunning the same script could be
difficult because of changed conditions. Maintenance typically only done by the original author will prevent further improvments.

## Software packages

Requires all resources to be managed in this way which makes small changes much more work intensive and slower.

~~~ENDSECTION~~~
