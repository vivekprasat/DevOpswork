#!/bin/bash

echo "==== DevOps Automation Simulation ===="

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "Docker not found! Please install Docker."
    exit 1
fi

# Check for Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found! Please install Docker Compose."
    exit 1
fi

echo "Setting up environment..."
docker-compose down -v
docker-compose build
docker-compose up -d

echo "All services are up and running!"
echo "Access Jenkins: http://localhost:8080"
echo "Access App: http://localhost"
