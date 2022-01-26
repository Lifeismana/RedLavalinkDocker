# Red Lavalink Docker Image
<!-- Thanks PhasecoreX -->
# POC RedLavalink in a Docker container
Puts a lavalink jar from [there](https://github.com/Cog-Creators/Lavalink-Jars) in a multi arch container

## Quick Start

Just run this:

```docker
docker run ghcr.io/lifeismana/redlavalinkdocker:latest
```

## Docker Compose

As with any Docker run command, you can also specify it as a docker-compose.yml file for easier management. Here is an example:

```yaml
version: "3.2"
services:
  red-lavalink:
    container_name: red-lavalink
    image: ghcr.io/lifeismana/redlavalinkdocker
```

## Things to improve

Switching a release state from prereleased to released doesn't trigger a github action

Change the prerelease branch name ?