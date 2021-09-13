##### using the slim vers to support arm 32

FROM adoptopenjdk/openjdk13:slim
##### END OF ZULU OPENJDK DOCKERFILE

# FROM azul/zulu-openjdk:13

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


