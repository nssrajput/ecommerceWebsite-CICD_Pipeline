#!/bin/bash

# Source directory
SOURCE_DIR="."

# Destination directory
DESTINATION_DIR="/home/ec2-user/ecommercevolume"

# Create destination directory if it doesn't exist
mkdir -p "$DESTINATION_DIR"

# Copy all contents from source to destination directory
cp -r  $SOURCE_DIR/$DESTINATION_DIR/


echo "updating files successfully"
