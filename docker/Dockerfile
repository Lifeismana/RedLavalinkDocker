##### using the slim vers to support arm 32

FROM ubuntu:focal
ARG ZULU_REPO_VER=1.0.0-3

ENV DEBIAN_FRONTEND=noninteractive\
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8\
    TZ=Europe/Paris

RUN sudo rm -rf /var/lib/apt/lists/* && \
    apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales curl gosu && \
    locale-gen en_US.UTF-8 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 && \
    curl -sLO https://cdn.azul.com/zulu/bin/zulu-repo_${ZULU_REPO_VER}_all.deb && dpkg -i zulu-repo_${ZULU_REPO_VER}_all.deb && \
    apt-get -qq update && \
    apt-get -qq -y dist-upgrade && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -qq -y --no-install-recommends install zulu17-jdk && \
    apt-get -qq -y purge gnupg software-properties-common curl && \
    apt -y autoremove && \
    rm -rf /var/lib/apt/lists/* zulu-repo_${ZULU_REPO_VER}_all.deb \
    dpkgArch="$(dpkg --print-architecture)";

ENV JAVA_HOME=/usr/lib/jvm/zulu17-ca-${dpkgArch}
#Thanks Draper

# * ↓ This needs to be changed when changing repo 
LABEL maintainer="Lifeismana"

EXPOSE 2333

WORKDIR /Lavalink/

COPY application.yml application.yml

COPY start.sh start.sh

COPY Lavalink.jar Lavalink.jar

RUN chmod +x start.sh

RUN groupadd -g 322 lavalink && useradd -r -u 322 -g lavalink lavalink

USER lavalink

ENV JAVA_OPTIONS=-Xmx4G

CMD ["/bin/sh", "start.sh"]


