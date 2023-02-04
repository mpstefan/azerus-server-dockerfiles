FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
	&& groupadd -g 1000 valheim \
	&& useradd -m -d /home/valheim -u 1000 -g 1000 valheim \
	&& apt-get update \
	&& apt-get install -y lib32stdc++6 lib32gcc1 wget tar tzdata libsdl2-dev wine64 xvfb nano \
	&& apt-get clean

USER valheim

# Install SteamCMD
RUN mkdir -vp /tmp/steamcmd \
	&& cd /tmp/steamcmd \
	&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
	&& tar -xvzf steamcmd_linux.tar.gz \
	&& rm steamcmd_linux.tar.gz

# Install Valheim
WORKDIR /tmp/steamcmd
# Workaround for https://www.reddit.com/r/SteamCMD/comments/nv9oey/error_failed_to_install_app_xxx_disk_write_failure/
RUN mkdir -vp /home/valheim/steamapps
RUN ./steamcmd.sh +force_install_dir /home/valheim +login anonymous +app_update 896660 +quit

# Clean temporary files
USER root
RUN rm -rf /var/lib/apt/* /tmp/* /var/tmp/*

USER valheim
WORKDIR /home/valheim

EXPOSE 2456/udp
EXPOSE 2457/udp

CMD eval xvfb-run -a wine valheim_server.exe -nographics -batchmode -name "Azerus" -port 2456 -world "Dedicated" -password "V@lh3imP@$$w0rd" -crossplay