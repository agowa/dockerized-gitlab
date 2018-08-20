FROM gitlab/gitlab-ce:latest
MAINTAINER agowa338

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable" && \
    apt update && \
    apt install docker-ce && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean
