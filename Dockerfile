FROM jenkins/inbound-agent
LABEL maintainer cmtedouglas@hotmail.com

USER root
RUN set -ex && apt update && \
               apt install -y build-essential \
                       apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg2 \
                       software-properties-common

RUN set -ex && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
               add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
               $(lsb_release -cs) \
               stable" && \
               apt-get update && \
               apt-get -y install docker-ce

USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
