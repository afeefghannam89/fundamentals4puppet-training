#!/bin/bash
 
if [ ! -d /home/training/puppet/ ]; then
su - training -c 'git clone git@puppet.localdomain:puppet.git '
fi
