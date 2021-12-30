#!/bin/bash

# if there is config file in a volume, 
# override localhost to point to host ip address
if [ -f stellar.yaml ]; then
  sed -i 's/localhost/host.docker.internal/g' stellar.yaml
fi

# fix orphaned process in stellar
sed -i "s/os.fork() if hasattr(os, 'fork') else None/None/g"  /usr/local/lib/python2.7/site-packages/stellar/app.py
rm -rf /usr/local/lib/python2.7/site-packages/stellar/app.pyc

stellar "$@"