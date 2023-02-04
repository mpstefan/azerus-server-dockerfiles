RUN export DEBIAN_FRONTEND=noninteractive \
        && groupadd -g 1000 valheim \
        && useradd -m -d /home/valheim -u 1000 -g 1000 valheim \
        && apt-get update \
        && apt-get install -y lib32stdc++6 lib32gcc1 wget tar tzdata libsdl2-dev nano libpulse-dev libatomic1 libc6 \
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
EXPOSE 2456/tcp
EXPOSE 2457/udp
EXPOSE 2457/tcp

COPY --chown=1000:1000 start_azerus_valheim.sh /home/valheim/start_azerus_valheim.sh
RUN chmod +x ./start_azerus_valheim.sh

CMD ./start_azerus_valheim.sh