#!/usr/bin/env bash

set -e

cd Jekyll-Onion-blog-main/DEV/

dev_dir=$(pwd)

su -c "$dev_dir/docker-installation.sh && $dev_dir/config-blog-over-tor.sh"

newgrp - docker

./docker.sh

blog_hostname=`cat /tmp/blog_hostname`

cat <<END
+---------------------------------------------------------+
 Recuerde que este es el enlace que sus lectores
 deben usar para acceder a su nuevo blog utilizando
 Tor Browser: $blog_hostname
+---------------------------------------------------------+
END