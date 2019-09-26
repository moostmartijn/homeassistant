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
- Soundbar HW-MS650 (to control the Soundbar I installed a community add-on through HACS named [Samsung Multi Room](https://github.com/dariornelas/ha_samsung_multi_room) )
- Roomba 960 [connecting the Roomba with Home Asistant](https://github.com/NickWaterton/Roomba980-Python#how-to-get-your-usernameblid-and-password)
- ESP32-Cam [Flashing the ESP32-Cam](https://randomnerdtutorials.com/esp32-cam-video-streaming-face-recognition-arduino-ide/)
# 2. Add-ons

- [AdGuard Home](https://community.home-assistant.io/t/community-hass-io-add-on-adguard-home/90684)
- [ESPHome](https://esphome.io/)
- [Google Assistant webserver](https://community.home-assistant.io/t/community-hass-io-add-on-google-assistant-webserver-broadcast-messages-without-interrupting-music/37274)
- [Grafana](https://community.home-assistant.io/t/community-hass-io-add-on-grafana/54674)
- [InfluxDB](https://community.home-assistant.io/t/community-hass-io-add-on-influxdb/54491/9)
- [Node-RED](https://community.home-assistant.io/t/community-hass-io-add-on-node-red/55023)
- [Spotify Connect](https://community.home-assistant.io/t/community-hass-io-add-on-spotify-connect/61210)
- [Wire Guard](https://community.home-assistant.io/t/community-hass-io-add-on-wireguard/134662)
- [deCONZ](https://github.com/home-assistant/hassio-addons/tree/master/deconz)

# 3. Automations

iOS notifications:

Lights:
- [Turn on the lights when someone comes home after sunset](/automations/lights/light_woonkamer_on_home_zone_sunset.yaml)

Switch:


# 4. Backups

I automate my backups using [Dropbox Sync](https://github.com/danielwelch/hassio-dropbox-sync) add-on, uploading my daily (full) snapshot to Dropbox. This upload to Dropbox is automaticly stored on my Synology DS718+, which keeps the last 5 snapshots and delete the other snapshots. 

