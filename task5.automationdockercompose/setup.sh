#!/bin/bash

echo "==== DevOps Automation Simulation ===="

# ----------------------------------------------
# 1) INSTALL DOCKER IF NOT FOUND
# ----------------------------------------------
if ! command -v docker &> /dev/null; then
    echo "Docker not found! Installing Docker..."

    # Remove old versions (optional)
    sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null

    # Update packages
    sudo apt update

    # Install dependencies
    sudo apt install -y ca-certificates curl gnupg lsb-release

    # Add Docker GPG Key
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    # Add Docker Repo
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Install Docker Engine
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Add user to Docker group
    sudo usermod -aG docker $USER
    echo "Docker installed successfully!"
    echo "You must restart your terminal or run: newgrp docker"
fi


# ----------------------------------------------
# 2) INSTALL DOCKER COMPOSE IF NOT FOUND
# (Docker Compose V2 comes with Docker plugin)
# ----------------------------------------------
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found! Installing Docker Compose plugin..."
    sudo apt install -y docker-compose-plugin
    echo "Docker Compose installed successfully!"
fi


# ----------------------------------------------
# 3) RUN DOCKER COMPOSE PROJECT
# ----------------------------------------------
echo "Setting up environment..."

# Use correct docker compose format
if command -v docker compose &> /dev/null; then
    COMPOSE="docker compose"
else
    COMPOSE="docker-compose"
fi

$COMPOSE down -v
$COMPOSE build
$COMPOSE up -d

echo "All services are up and running!"
echo "Access Jenkins: http://localhost:8080"
echo "Access App: http://localhost"
