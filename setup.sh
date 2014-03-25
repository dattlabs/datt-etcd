#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CURRENT_DIR="${DIR##*/}"

# create the necessary directories
for i in "data" "logs" "tmp"; do
  mkdir -vp /mnt/$CURRENT_DIR/$i
done
mkdir -vp /var/log/supervisor/$CURRENT_DIR

# install the supervisor config.
cp -v $DIR/supervisor/*.conf /etc/supervisor/conf.d/
supervisorctl update
