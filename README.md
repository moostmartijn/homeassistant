# homeassistant
I run Home Assistant under Hass.io on a Raspberry Pi 3B. 

# 1. Hardware

Raspberry Pi 3B

## Phoscon Conbee II Zigbee USB stick
- Ikea light bulbs
- Xiaomi Aqara sensors (temperature/humidity & door window open/close)

## RFLink gateway (Arduino Mega)
### Klik Aan Klik Uit
    I use the ACL-LV10 to control the ComfoFanS ventilation unit. 

## Raspberry Pi Zero (Plantgateway)
### Xiaomi plant sensors
    Because the Xiaomi plant sensors are too far away from the Raspberry Pi, they're not able to communicatie with eacht other through bluetooth. So solve this problem I installed [Plantgateway](https://github.com/ChristianKuehnel/plantgateway) on a Raspberry Pi Zero to send the sensor output over to Home Assistant using MQTT)


## Connected hardware through Home Assistant:
<br>Broadlink RM3 mini
<br>Google Home Mini
<br>Soundbar HW-MS650 (to control the Soundbar I installed a community add-on through HACS named [Samsung Multi Room](https://github.com/dariornelas/ha_samsung_multi_room) )
<br>Roomba 960 [connecting the Roomba with Home Asistant](https://github.com/NickWaterton/Roomba980-Python#how-to-get-your-usernameblid-and-password)
<br>ESP32-Cam [Flashing the ESP32-Cam](https://randomnerdtutorials.com/esp32-cam-video-streaming-face-recognition-arduino-ide/)
# 2. Add-ons

<br>[AdGuard Home](https://community.home-assistant.io/t/community-hass-io-add-on-adguard-home/90684)
<br>[ESPHome](https://esphome.io/)
<br>[Google Assistant webserver](https://community.home-assistant.io/t/community-hass-io-add-on-google-assistant-webserver-broadcast-messages-without-interrupting-music/37274)
<br>[Grafana](https://community.home-assistant.io/t/community-hass-io-add-on-grafana/54674)
<br>[InfluxDB](https://community.home-assistant.io/t/community-hass-io-add-on-influxdb/54491/9)
[Node-RED](https://community.home-assistant.io/t/community-hass-io-add-on-node-red/55023)
<br>[Samba share](https://www.home-assistant.io/addons/samba/)
<br>[Spotify Connect](https://community.home-assistant.io/t/community-hass-io-add-on-spotify-connect/61210)
<br>[Wire Guard](https://community.home-assistant.io/t/community-hass-io-add-on-wireguard/134662)
<br>[deCONZ](https://github.com/home-assistant/hassio-addons/tree/master/deconz)

# 3. Frontend

## Custom Compact Header

To save space on my Home Assistant iPhone app I use the [Compact Custom Header](https://community.home-assistant.io/t/compact-custom-header/83716) community add-on.

![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/custom_compact_header.png "Compact Custom Header")

[View my configuration in 'ui-lovelace.yaml'](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L47-L53)

## Home 
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_home.png "Home Tab")

[View this tab in 'ui-lovelace.yaml'](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L57-L280)

## Weather
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_weather.png "Weather Tab")

[View this tab in 'ui-lovelace.yaml'](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L281-L462)

## Music
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_music.png "Music Tab")

[View this tab in 'ui-lovelace.yaml'](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L508-L666)

### Background
As seen a little bit in this picture, the background of the Home Assistant frontend shows the current playing track of Spotify using the community add-on [Lovelace Media Art Background](https://github.com/TheLastProject/lovelace-media-art-background)

### Spotify controls

[View my configuration in spotify_controls.yaml (in `/packages`)](https://github.com/moostmartijn/homeassistant/blob/master/packages/spotify_controls.yaml)

# 4. Automations

iOS notifications:

Lights:
- [Turn on the lights when someone comes home after sunset](/automations/lights/light_woonkamer_on_home_zone_sunset.yaml)

Switch:


# 5. Backups

I automate my backups using [Dropbox Sync](https://github.com/danielwelch/hassio-dropbox-sync) add-on, uploading my daily (full) snapshot to Dropbox. This upload to Dropbox is automaticly stored on my Synology DS718+, which keeps the last 5 snapshots and delete the other snapshots. 

