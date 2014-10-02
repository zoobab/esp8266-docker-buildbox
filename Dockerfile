FROM ubuntu:12.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q git autoconf build-essential gperf bison flex texinfo libtool libncurses5-dev wget apt-utils gawk sudo unzip
RUN useradd -d /opt/Espressif -m -s /bin/bash esp8266
RUN echo "esp8266 ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/esp8266
RUN chmod 0440 /etc/sudoers.d/esp8266
RUN su esp8266 -c "cd ~; git clone -b lx106 git://github.com/jcmvbkbc/crosstool-NG.git"
RUN su esp8266 -c "cd ~/crosstool-NG && ./bootstrap"
RUN su esp8266 -c "cd ~/crosstool-NG && ./configure --prefix=`pwd`"
RUN su esp8266 -c "cd ~/crosstool-NG && make"
RUN su esp8266 -c "cd ~/crosstool-NG && sudo make install"
RUN su esp8266 -c "cd ~/crosstool-NG && ./ct-ng xtensa-lx106-elf"
RUN su esp8266 -c "cd ~/crosstool-NG && ./ct-ng build"
RUN su esp8266 -c "wget -q http://rghost.net/download/58019758/eff3feb46a2047a0de0d56479d21fab434429fea/esp8266_sdk_v0.9.1.zip -O ~/esp8266_sdk_v0.9.1.zip"
RUN su esp8266 -c "cd ~; unzip esp8266_sdk_v0.9.1.zip; mv esp8266_sdk_v0.9.1 ESP8266_SDK"
RUN su esp8266 -c "wget -q http://filez.zoobab.com/esp8266/esptool-0.0.2.zip -O ~/ESP8266_SDK/esptool-0.0.2.zip"
RUN su esp8266 -c "cd ~/ESP8266_SDK; unzip esptool-0.0.2.zip"
RUN su esp8266 -c "cd ~/ESP8266_SDK/esptool; sed -i 's/WINDOWS/LINUX/g' Makefile; make"
