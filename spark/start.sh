docker run -d --dns=172.17.0.1 --name master1 spark_master
docker run -d --dns=172.17.0.1 --name worker1 spark_worker
docker run -d --dns=172.17.0.1 --name worker2 spark_worker
