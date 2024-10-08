#!/bin/bash

# Stop and remove containers
docker stop iot_server_backend iot_server_db
docker rm iot_server_backend iot_server_db

# Remove network
docker network rm iot_server_network

echo "IoT Server application has been stopped and containers removed."
