# Updating firmware via plugin
* Install FirmwareUpdater Plugin https://github.com/OctoPrint/OctoPrint-FirmwareUpdater
* Install avrdude on the RaspberryPi, which is used for flashing
* Set FirmwareUpdater Plugin Settings
  - Settings > Plugins > open FirmwareUpdater Plugin
  - Click wrench on top right
  - Flash method: avrdude (Atmel AVR Family)
  - AVR MCU: ATmega2560
  - Path to avrdude: /usr/bin/avrdude (we installed it in step 2)
  - AVR Programmer Type: wiring
* Update firmware
* Check firmware on your printer: Menu > support
* Download latest Firmware: https://www.prusa3d.com/drivers/
* extract .hex file from downloaded zip
* Open FirmwareUpdater Plugin
* ...from file > Browse > and select .hexfile
* click Flash from file - and wait ...
* Done - check firmware again on your printer under Menu > support

## Setting up the webcam
The ansible script will install the spyglass software and start the webcam systemd process.

You need to go into the settings and add the following streams changing the URL to your raspberry pi:

- http://octoprint.local:8080/stream
- http://octoprint.local:8080/snapshot
