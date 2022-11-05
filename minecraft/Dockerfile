FROM eclipse-temurin:19-jdk-alpine

RUN apk update \
	&& addgroup -g 1000 minecraft \
	&& adduser -h /home/minecraft -u 1001 -G minecraft -D minecraft \
    && apk add wget \
    && rm -rf /var/lib/apt/lists/*

USER minecraft
WORKDIR /home/minecraft

# Paper Jar
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/259/downloads/paper-1.19.2-259.jar


# Download Mojang Jar and Generate EULA
RUN java -jar paper-1.19.2-259.jar nogui

# Accept EULA
RUN sed -i 's/false/true/g' eula.txt

# Plugins

RUN wget -P ~/plugins https://www.spigotmc.org/resources/anti-elytra-boost.42766/download?version=278467
RUN wget -P ~/plugins https://www.spigotmc.org/resources/dynmap%C2%AE.274/download?version=465636
RUN wget -P ~/plugins https://www.spigotmc.org/resources/dynmap-griefprevention.98376/download?version=463430
RUN wget -P ~/plugins https://www.spigotmc.org/resources/griefprevention.1884/download?version=443503

# Minecraft Port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Dynmap Port
EXPOSE 8192/tcp

# UPDATE HERE
CMD exec java -server -Xms2G -Xmx2G -jar paper-1.19.2-259.jar nogui