FROM ubuntu:20.04

ARG VERSION_ID=20.04
# https://serverfault.com/questions/949991/
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Taipei

RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*
RUN sh -c 'echo "deb http://download.opensuse.org/repositories/home:/p4lang/xUbuntu_${VERSION_ID}/ /" | tee /etc/apt/sources.list.d/home:p4lang.list'
RUN sh -c 'curl -L "http://download.opensuse.org/repositories/home:/p4lang/xUbuntu_${VERSION_ID}/Release.key" | apt-key add -'
RUN apt-get update && apt-get install -y \
    p4lang-p4c \
    && rm -rf /var/lib/apt/lists/*
