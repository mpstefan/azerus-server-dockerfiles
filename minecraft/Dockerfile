FROM eclipse-temurin:19-jdk-alpine

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get install -y jq \
    && rm -rf /var/lib/apt/lists/*

# UPDATE HERE
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/259/downloads/paper-1.19.2-259.jar

# Minecraft Port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Dynmap Port
EXPOSE 8192/tcp

# UPDATE HERE
CMD exec java -server -jar paper-1.19.2-259.jar nogui