# raspberry-coffee

Holds flows for raspberry coffee waste counter with NodeRED.

## Installation

1.  Fresh raspian package from [raspberrypi.org](https://www.raspberrypi.org/downloads/raspbian/)
2.  Connect your device with a HDMI cable to a monitor and start the configuration process with ``raspi-config``
    1.  Expand dis space
    2.  Enable SSH
    3.  Change you password
3.  Look for the IP in network and connect with ``ssh pi@192.168.X.X`` The password is _raspberry_
4.  Install NodeRED ``sudo apt-get update &&
sudo apt-get install nodered``
5.  Start NodeRED on startup ``sudo systemctl enable nodered.service``
6.  Update node ``sudo npm cache clean -f && sudo npm install -g n && sudo n stable``   
7.  Install additional nodes
````
sudo apt-get install npm
sudo npm install -g npm@2.x
hash -r
cd ~/.node-red
npm i node-red-node-pibrella node-red-node-xmpp node-red-node-feedparser
````

## Setup

### Wifi

1.  Configure the Wifi connection ``sudo nano /etc/wpa_supplicant/wpa_supplicant.conf``

2.  Edit _wpa_supplicant.conf_

```
country=GB
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="xxx"
    psk="xxx"
}
```

3.  Restart adapter ``sudo ifdown wlan0 && ifup wlan0``
4.  Check IP address ``ifconfig wlan0`` it should be look like this

```
wlan0     Link encap:Ethernet  HWaddr 14:cc:20:22:ee:21  
          inet addr:192.168.178.32  Bcast:192.168.178.255  Mask:255.255.255.0
          inet6 addr: fe80::7633:6243:492e:6985/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:10 errors:0 dropped:532 overruns:0 frame:0
          TX packets:30 errors:0 dropped:1 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:2428 (2.3 KiB)  TX bytes:5618 (5.4 KiB)
```
