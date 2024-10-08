# iot-server-deployment

This project is a Nest.js based IoT server backend application.

## Prerequisites

- Docker

## Getting Started

1. Clone the repository:
   ```
   git clone <your-repository-url>
   cd iot-server-project
   ```

2. Set up the environment:
   ```
   cp .env.example .env
   ```
   Edit the `.env` file and update the values as needed.

3. Start the application:
   ```
   chmod +x scripts/start.sh
   ./scripts/start.sh
   ```

4. The IoT server application should now be running at `http://localhost:3002`

## Stopping the Application

To stop the IoT server application and remove the containers:

```
chmod +x scripts/stop.sh
./scripts/stop.sh
```

## Development

For development, you can use the following commands:

- To view logs: 
  ```
  docker logs -f iot_server_backend
  docker logs -f iot_server_db
  ```
- To rebuild the application: 
  ```
  docker build -t iot-server-backend .
  docker stop iot_server_backend
  docker rm iot_server_backend
  docker run -d --name iot_server_backend --network iot_server_network -p 3002:3002 --env-file .env iot-server-backend
  ```

## Troubleshooting

If you encounter any issues, please check the Docker logs or open an issue in the repository.
