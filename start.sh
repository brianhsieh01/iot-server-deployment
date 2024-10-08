#!/bin/bash

# Check if .env file exists, if not, create it from .env.example
if [ ! -f .env ]; then
    cp .env.example .env
    echo "Created .env file from .env.example. Please update it with your actual values."
    exit 1
fi

# Load environment variables
source .env

# Create Docker network
docker network create iot_server_network

# Start PostgreSQL container
docker run -d \
    --name iot_server_db \
    --network iot_server_network \
    -e POSTGRES_USER=$DATABASE_USERNAME \
    -e POSTGRES_PASSWORD=$DATABASE_PASSWORD \
    -e POSTGRES_DB=$DATABASE_NAME \
    -v iot_server_db_data:/var/lib/postgresql/data \
    postgres:16.4

# Build and start Nest.js application
docker run -d \
    --name iot_server_backend \
    --network iot_server_network \
    -p 3002:3002 \
    --env-file .env \
    chyuanxie/iot-server-backend:v1.0

echo "IoT Server application is starting. You can access it at http://localhost:3002"
