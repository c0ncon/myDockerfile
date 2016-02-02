#!/bin/sh

# setup docker service discovery container
# setup skydns
docker pull crosbymichael/skydns
docker run -d -p 53:53/udp --dns=172.17.0.1 --name skydns crosbymichael/skydns -nameserver 8.8.8.8:53 -domain docker

# setup skydock
docker pull crosbymichael/skydock
docker run -d -v /var/run/docker.sock:/docker.sock --dns=172.17.0.1  --name skydock crosbymichael/skydock -ttl 30 -environment dev -s /docker.sock -domain docker -name skydns
