#!/bin/bash
old_username="vagrant"
new_username="vm2"
usermod -l $new_username $old_username
usermod -d /home/$new_username -m $new_username
groupmod -n $new_username $old_username
find / -user $old_username -exec chown -h $new_username {} \;
find / -group $old_username -exec chgrp -h $new_username {} \;
echo "$new_username ALL=(ALL:ALL) ALL" >> /etc/sudoers