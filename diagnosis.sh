#!/bin/bash

echo "Clearing cache..."

# Remove all .pyc files in the current directory and its subdirectories
find . -name "*.pyc" -exec rm -f {} +

echo "Python cache cleared successfully."

# re-trigger testing script
 ./test.sh

 echo "try to test again.."
