FROM java-8-oracle

# Install curl
RUN apt-get update
RUN apt-get install -y curl
RUN locale-gen en_US en_US.UTF-8

# Zookeeper dir
RUN mkdir -p /var/run/zookeeper

# Downloading zookeeper 3.4.6
RUN curl http://mirror.sdunix.com/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz -o /home/zookeeper.tar.gz
RUN tar -xzf /home/zookeeper.tar.gz -C /home
RUN mv /home/zookeeper-3.4.6 /home/zookeeper
RUN rm /home/zookeeper.tar.gz

COPY zoo.cfg /home/zookeeper/conf/zoo.cfg

RUN chmod +x /home/zookeeper/bin/zkServer.sh

EXPOSE 2181 2888 3888

CMD echo $MYID > /var/run/zookeeper/myid && /home/zookeeper/bin/zkServer.sh start-foreground
