FROM ubuntu:bionic

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ARG ZULU_REPO_VER=1.0.0-2

RUN apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales curl && \
    locale-gen en_US.UTF-8 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
    curl -sLO https://cdn.azul.com/zulu/bin/zulu-repo_${ZULU_REPO_VER}_all.deb && dpkg -i zulu-repo_${ZULU_REPO_VER}_all.deb && \
    apt-get -qq update && \
    apt-get -qq -y dist-upgrade && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -qq -y --no-install-recommends install zulu13-jdk=13.0.8-* && \
    apt-get -qq -y purge gnupg software-properties-common && \
    apt -y autoremove && \
    rm -rf /var/lib/apt/lists/* zulu-repo_${ZULU_REPO_VER}_all.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu13-ca-amd64

#Thanks Draper
LABEL maintainer="Lifeismana"

EXPOSE 2333

WORKDIR /Lavalink/

COPY application.yml application.yml

COPY start.sh start.sh

COPY Lavalink.jar Lavalink.jar

RUN chmod +x start.sh

RUN groupadd -g 322 lavalink && useradd -r -u 322 -g lavalink lavalink

USER lavalink

CMD ["/bin/sh", "start.sh"]


