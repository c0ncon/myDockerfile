docker run -d --dns=172.17.0.1 --env MYID=1 --name zookeeper1 zookeeper
docker run -d --dns=172.17.0.1 --env MYID=2 --name zookeeper2 zookeeper
docker run -d --dns=172.17.0.1 --env MYID=3 --name zookeeper3 zookeeper
