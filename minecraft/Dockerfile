FROM eclipse-temurin:23-jdk-alpine

RUN apk update \
	&& addgroup -g 1000 minecraft \
	&& adduser -h /home/minecraft -u 1001 -G minecraft -D minecraft \
    && apk add wget \
    && rm -rf /var/lib/apt/lists/*

USER minecraft
WORKDIR /home/minecraft

# Paper Jar
RUN wget https://api.papermc.io/v2/projects/paper/versions/1.21.3/builds/81/downloads/paper-1.21.3-81.jar

# Download Mojang Jar and Generate EULA
RUN java -jar paper-1.21.3-81.jar nogui

# Accept EULA
RUN sed -i 's/false/true/g' eula.txt

# Minecraft Port
EXPOSE 25565/tcp
EXPOSE 25565/udp

# Dynmap Port
EXPOSE 8192/tcp

# UPDATE HERE
CMD exec java -Xms12G -Xmx12G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-1.21.3-81.jar --nogui