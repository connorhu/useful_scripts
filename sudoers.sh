#!/bin/sh

echo -n "Username: "
read user

if [ ! "$user" ]
then
  exit
fi

sudoer_filename="10_${user}"

echo "

$user    ALL=NOPASSWD:ALL

" > /etc/sudoers.d/${sudoer_filename}
chmod 0440 /etc/sudoers.d/${sudoer_filename}
