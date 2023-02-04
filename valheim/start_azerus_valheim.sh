export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

./valheim_server.x86_64 -name "Azerus" -port 2456 -world "Dedicated" -password "V@lh3imP@ssw0rd" -crossplay

export LD_LIBRARY_PATH=$templdpath