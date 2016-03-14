#!/bin/sh

latest_file=$(curl -s https://nodejs.org/dist/latest/SHASUMS256.txt | awk '{ print $2 }' | grep linux.*x64.*gz)
curl -s https://nodejs.org/dist/latest/$latest_file > /opt/$latest_file

cd /opt/
tar -xf $latest_file
node_dir=$(echo $latest_file | sed 's/.tar.gz//')
ln -s $node_dir node
cat /etc/environment | sed "s/\"\$/:\/opt\/node\"/" > /etc/environment.tmp
mv /etc/environment.tmp /etc/environment
rm *.gz
