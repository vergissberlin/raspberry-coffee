# raspberry-coffee

Holds flows for raspberry coffee waste counter with NodeRED.

## Installation

1.  Fresh raspian package from [raspberrypi.org](https://www.raspberrypi.org/downloads/raspbian/)
2.  Extract the _img_ file and copy to a SD-card with ``sudo dd bs=4M if=Downloads/2016-11-25-raspbian-jessie-lite.img of=/dev/mmcblk0``
3.  Connect your device with a HDMI cable to a monitor and start the configuration process with ``raspi-config``
    1.  Expand disk space!
    2.  Enable SSH!
    3.  Change your password!
    4.  Change _hostname_ to _coffee_!
4.  Look for the IP in network and connect with ``ssh pi@192.168.X.X`` The password is _raspberry_
5.  Install NodeRED ``sudo apt-get update &&
sudo apt-get install nodered``
6.  Start NodeRED on startup ``sudo systemctl enable nodered.service``
7.  Update node ``sudo npm cache clean -f && sudo npm install -g n && sudo n stable``   
8.  Install additional nodes
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

## Optional

### Deployment with git
If you wanna use git to save your flows, you have to install _git_ and create a _key_

1.  ``sudo apt update && apt install git-core``
2.  Gennerate ssh key ``ssh-keygen`` (hit _enter_ twice) and add the generated key to your deployment key list on your repository server ``cat .ssh/id_rsa.pub``
3.  Configure _git_
    -   ``git config --global push.default matching``
    -   ``git config --global user.name "Coffee"``
    -   ``git config --global user.email sammy@example.com``
4.  ``git clone YOUR-REPO.git ~/flows``

### WiFi wpa2 enterprise

1.  Generate configuration file ``/etc/wpa_supplicant.WPA2E.conf``
    ````
    network={
      ssid="NETWORK"
      scan_ssid=1
      key_mgmt=WPA-EAP
      identity="USERNAME"
      password="PASSWORD"
      eap=PEAP
      phase1="peaplabel=0"
      phase2="auth=MSCHAPV2"
    }
    ````
2.  Use configuration ``sudo wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.WPA2E.conf -d``
3.  Check ``sudo dhclient -v wlan0`` dhcp reactions.
4.  Check your IP ``ifconfig wlan0``
5.  Test internet connection ``ping -c 3 github.com``
