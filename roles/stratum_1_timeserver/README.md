# Startum 1 NTP server on a Raspberry pi
This is the ansible script you can use to provision a raspberry pi as a high-accuracy NTP server.

Your raspberry pi will automatically set time based on GPS satellites and can keep very accurate time with the PPS output from the receiver.

These scripts will also install chrony so that the time can be served on your home network or as part of the ntppool.org project.

Requirements:
1. Raspberry pi model 3 or above
2. Serial GPS device such as a cheap ublox 6m with pps output
3. A ds1307 real-time hardware clock

Wire the PPS output from the gps to pin 18 on the raspberry pi and connect the ds1307 to the i2c bus. The GPS device should be connected to the serial pins.

You can run this ansible script directly like so:
```
ansible-playbook -i "<IP ADDRESS>," provision.yml
```

## Useful commands
Identify the GPs hardware
```
$ gpsctl /dev/ttyAMA0

/dev/ttyAMA0 identified as a u-blox SW 7.03 (45969),HW 00040007 at 9600 baud.
```
Put the receiver into NMEA sentence mode
```
gpsctl -n /dev/ttyAMA0
```

Additional configuration options can be explored via [ubxtool](https://gpsd.io/ubxtool-examples.html) but the default settings are sufficient for an NTP server.
