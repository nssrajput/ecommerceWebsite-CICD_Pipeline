#!/bin/bash

# Check if the Docker container exists
if docker inspect --type container ecommerce &> /dev/null; then
    echo "Docker container ecommerce exists. Triggering copy.sh..."
    # trigger copy.sh
    ./copy.sh
else
    echo "Docker container ecommerce does not exist.Triggering deploy.sh..."
    
    ./deploy.sh
fi    
