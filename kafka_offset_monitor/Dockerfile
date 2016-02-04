FROM java-8-oracle

RUN apt-get update
RUN apt-get install -y curl
RUN locale-gen en_US en_US.UTF-8

RUN mkdir -p /home/KafkaOffsetMonitor

# Clone and build https://github.com/quantifind/KafkaOffsetMonitor.git for latest version
# 2016/01/27 0.3.0-SNAPSHOT
COPY KafkaOffsetMonitor-assembly-0.3.0-SNAPSHOT.jar /home/KafkaOffsetMonitor/KafkaOffsetMonitor-assembly-0.3.0-SNAPSHOT.jar

CMD java -cp /home/KafkaOffsetMonitor/KafkaOffsetMonitor-assembly-0.3.0-SNAPSHOT.jar \
  com.quantifind.kafka.offsetapp.OffsetGetterWeb \
  --offsetStorage kafka \
  --zk zookeeper1.zookeeper.dev.docker:2181,zookeeper2.zookeeper.dev.docker:2181,zookeeper3.zookeeper.dev.docker:2181 \
  --port 8080 \
  --refresh 10.seconds \
  --retain 2.days

EXPOSE 8080