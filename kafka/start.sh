docker run -d --dns=172.17.0.1 --env BROKER_ID=0 --name kafka0 kafka
docker run -d --dns=172.17.0.1 --env BROKER_ID=1 --name kafka1 kafka
docker run -d --dns=172.17.0.1 --env BROKER_ID=2 --name kafka2 kafka
