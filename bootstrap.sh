#!/bin/bash

# if there is config file in a volume, 
# override localhost to point to host ip address
if [ -f stellar.yaml ]; then
  sed -i 's/localhost/host.docker.internal/g' stellar.yaml
fi

stellar "$@"