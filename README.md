[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
ESP8266 Docker Buildbox
=======================

Usage
=====

> sudo docker build .

Export the serial adaptor
=========================

You can export the ttyUSB0 device from the HOST to the GUEST instance with this command:

> root@mybox# docker run --privileged -v=/dev/ttyUSB0:/dev/tty-from-host -i -t zoobab/esp8266-docker-buildbox /bin/bash
> 
> root@7dfd28f629ce:/# ls /dev/tty*
> 
> /dev/tty  /dev/tty-from-host  /dev/tty0  /dev/tty1  /dev/tty2
> /dev/tty3  /dev/tty4  /dev/tty5  /dev/tty6  /dev/tty7  /dev/tty8
> /dev/tty9

Todo
====

* Add blinky example
* Add esptool to push blinky example
* Find some other simpler examples
