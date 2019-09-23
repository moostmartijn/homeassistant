# homeassistant
I run Home Assistant under Hass.io on a Raspberry Pi 3B. 

# 1. Hardware

Raspberry Pi 3B

Phoscon Conbee II Zigbee USB stick
- Ikea light bulbs
- Xiaomi Aqara sensors (temperature/humidity & door window open/close)

RFLink gateway (Arduino Mega)
- Klik Aan Klik Uit

Raspberry Pi Zero (Plantgateway)
- Xiaomi plant sensors


## Connected hardware through Home Assistant:
- Broadlink RM3 mini
- Google Home Mini
- Soundbar HW-MS650
- Roomba 960 (connecting through this guide worked for me: https://github.com/NickWaterton/Roomba980-Python#how-to-get-your-usernameblid-and-password)

# 2. Add-ons

- Adguard Home
- ESP Home
- Google Assistant webserver
- Grafana
- Influx DB
- Node-Red
- Spotify Connect
- Wire Guard
- deConz

# 3. Automations

iOS notifications:

Lights:
- Turn on the lights when someone comes home after sunset

Switch:


# 4. Backups

I automate my backups using Dropbox Sync. on Hass.io, uploading my daily (full) snapshot to Dropbox. This upload to Dropbox is automaticly stored on my Synology DS718+, which keeps the last 5 snapshots and delete the other snapshots. 

