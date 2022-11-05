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

# Minecraft Port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Dynmap Port
EXPOSE 8192/tcp

# UPDATE HERE
CMD exec java -server -Xms2G -Xmx2G -jar paper-1.19.2-259.jar nogui