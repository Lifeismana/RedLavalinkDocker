FROM azul/zulu-openjdk:13

#Thanks Draper
LABEL maintainer="Lifeismana"

EXPOSE 2333

RUN apt-get update && apt-get install curl -y

COPY application.yml /lavalink/application.yml

COPY start.sh /lavalink/start.sh

COPY Lavalink.jar /lavalink/Lavalink.jar

RUN chmod +x /lavalink/start.sh

RUN groupadd -g 322 lavalink && useradd -r -u 322 -g lavalink lavalink

USER lavalink

WORKDIR /lavalink/

CMD ["/bin/sh", "start.sh"]


