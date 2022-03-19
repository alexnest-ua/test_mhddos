#!/bin/bash



#Install latest version of mhddos_proxy and MHDDoS
cd ~
rm -rf mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd mhddos_proxy
rm proxies_config.json
wget https://raw.githubusercontent.com/Aruiem234/mhddosproxy/main/proxies_config.json
git clone https://github.com/MHProDev/MHDDoS.git
python3 -m pip install -r MHDDoS/requirements.txt
