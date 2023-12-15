#!/bin/bash

# Check if a virtual environment exists, if not create one
if [ ! -d "venv" ]; then
    python3 -m venv venv
else 
    echo "virtual environment exists"
fi

# Activate the virtual environment
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run tests using pytest
if pytest; then
  
    echo "Tests passed successfully."

    # Deactivate the virtual environment
    deactivate

    # Trigger deploy.sh which will proceed further
    ./contcheck.sh
else
    
    echo "Tests failed. Attempting diagnosis problem and fixing common issues..."

    # Deactivate the virtual environment
    deactivate

    # Run the diagnosis bash script
    ./diagnosis.sh
fi
