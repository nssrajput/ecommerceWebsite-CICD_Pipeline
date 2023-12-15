#!/bin/bash

#copy/update content in the docker host volume
 ./copy.sh

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."

    # commands to install docker amazon-linux-2023
    sudo yum install -y docker
    sudo systemctl start docker

    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

# Check if Dockerfile exists
if [ ! -f Dockerfile ]; then
    echo "Dockerfile not found. Creating a Dockerfile..."

    # Create a Dockerfile
    cat <<EOT > Dockerfile
FROM nginx
VOLUME ["/websitevolume"]
WORKDIR /websitevolume
RUN apt-get update
EOT

    echo "Dockerfile created successfully."
else
    echo "Dockerfile already exists."
fi

#Build the docker image and container
docker build -t mrsoftwares .
docker run -d -p 8085:80 --name ecommerce -v /home/ec2-user/ecommercevol:/websitevolume mrsoftwares


   echo "successfully deployed"
