FROM ubuntu:18.04

RUN apt update && apt install -y dnsutils vim tmux wget curl gnupg watch apt-transport-https

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt update && apt install -y kubectl 

RUN apt update && apt install -y openjdk-8-jdk && \
    mkdir /spark24 && cd /spark24 && \
    wget http://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz && \
    tar zxvf spark-2.4.3-bin-hadoop2.7.tgz

WORKDIR /spark24/spark-2.4.3-bin-hadoop2.7 

ENTRYPOINT ["/bin/bash"]
