#! /usr/bin/env sh

set -e

echo "Starting Red's Lavalink"
java -Djdk.tls.client.protocols=TLSv1.1,TLSv1.2 $JAVA_OPTIONS -jar Lavalink.jar