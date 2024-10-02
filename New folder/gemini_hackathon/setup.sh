#!/bin/bash

# Create a virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo ".env file not found!"
    deactivate
    exit 1
fi

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Check if GOOGLE_API_KEY is set
if [ -z "$GOOGLE_API_KEY" ]; then
    echo "GOOGLE_API_KEY is not set in the .env file. ADD IT Y'ALL."
    deactivate
    exit 1
fi

# Install Python dependencies in the virtual environment
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Set up Ngrok authtoken
if [ -z "$NGROK_AUTHTOKEN" ]; then
    echo "NGROK_AUTHTOKEN not set in .env. SET IT UP!!!."
    deactivate
    exit 1
fi

echo "Configuring Ngrok authtoken..."
ngrok config add-authtoken $NGROK_AUTHTOKEN

# Run the Python application
echo "Running the application..."
python run.py

# Deactivate the virtual environment after execution
deactivate

