#!/bin/bash
set -e

echo "Starting deployment..."

# Stop existing application
sudo pkill -f "python3 app.py" || true

# Update application
cd /home/ubuntu/flask-cicd-lab
git pull origin main

# Install dependencies
pip3 install -r requirements.txt

# Start application in background
nohup python3 app.py > app.log 2>&1 &

echo "Deployment completed successfully!"