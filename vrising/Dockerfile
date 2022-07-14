FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
	&& groupadd -g 1000 vrising \
	&& useradd -m -d /home/vrising -u 1000 -g 1000 vrising \
	&& apt-get update \
	&& apt-get install -y lib32stdc++6 lib32gcc1 wget tar tzdata libsdl2-dev wine64 xvfb nano \
	&& apt-get clean

USER vrising

# Install SteamCMD
RUN mkdir -vp /tmp/steamcmd \
	&& cd /tmp/steamcmd \
	&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
	&& tar -xvzf steamcmd_linux.tar.gz \
	&& rm steamcmd_linux.tar.gz

# Install V Rising
WORKDIR /tmp/steamcmd
# Workaround for https://www.reddit.com/r/SteamCMD/comments/nv9oey/error_failed_to_install_app_xxx_disk_write_failure/
RUN mkdir -vp /home/vrising/steamapps
RUN ./steamcmd.sh +force_install_dir /home/vrising +login anonymous +app_update 1829350 +quit

# Clean temporary files
USER root
RUN rm -rf /var/lib/apt/* /tmp/* /var/tmp/*

USER vrising
WORKDIR /home/vrising

EXPOSE 9876/udp
EXPOSE 9877/udp

CMD eval xvfb-run -a wine VRisingServer.exe -persistentDataPath ./data