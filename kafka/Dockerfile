FROM java-8-oracle

# Install curl
RUN apt-get update
RUN apt-get install -y curl
RUN locale-gen en_US en_US.UTF-8

# kafka dir
RUN mkdir -p /tmp/kafka-logs

# Downloading kafka 0.9.0.0 with scala 2.10
RUN curl http://ftp.jaist.ac.jp/pub/apache/kafka/0.9.0.0/kafka_2.10-0.9.0.0.tgz -o /home/kafka.tgz
RUN tar -xzf /home/kafka.tgz -C /home
RUN mv /home/kafka_2.10-0.9.0.0 /home/kafka
RUN rm /home/kafka.tgz

COPY server.properties /home/kafka/config/server.properties

RUN chmod +x /home/kafka/bin/kafka-server-start.sh
ENV KAFKA_JMX_OPTS -Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false
ENV JMX_PORT 9997

EXPOSE 9092 9997

CMD echo "broker.id=$BROKER_ID" >> /home/kafka/config/server.properties && \
  echo "host.name=`ifconfig eth0 | grep "inet addr" | cut -d":" -f 2 | cut -d" " -f 1`" >> /home/kafka/config/server.properties && \
  echo "advertised.host.name=`ifconfig eth0 | grep "inet addr" | cut -d":" -f 2 | cut -d" " -f 1`" >> /home/kafka/config/server.properties && \
  /home/kafka/bin/kafka-server-start.sh /home/kafka/config/server.properties
