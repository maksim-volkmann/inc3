#!/bin/bash

# Ensure the destination directory exists
mkdir -p /static-site

# Copy files from the container to the host-mounted volume
cp -R /static-site/* /static-site/

# Exit gracefully
exit 0
