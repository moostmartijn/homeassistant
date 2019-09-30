# Home Assistant configuration
I've been running Home Assistant under Hass.io on a Raspberry Pi 3b since february 2019. Since then I'm adding more and more (hardware) sensors to the configuration to make my home as 'smart' or 'connected' as possible. 

I like to have a nice looking frontend which I use to control and view all of my sensors, media players and other integrations of Home Assistant. 

# 1. Hardware

These are all of my hardware devices and sensors I have connected to Home Assistant.

| Raspberry Pi 3b | Description | Arduino Mega | [More info](https://github.com/moostmartijn/homeassistant#rflink-gateway-arduino-mega) |
| ---------|-------------|----------|-------------|
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/raspberry_pi_3b.jpg" alt="Raspberry Pi 3b+" width="200"/> | Running Hass.io | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/arduino_mega.jpg" alt="Arduino Mega" width="200"/> | RFlink gateway host |
| <b>Raspberry Pi Zero W</b> | [More info](https://github.com/moostmartijn/homeassistant#raspberry-pi-zero-plantgateway) | <b>Google Home Mini</b> | |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/raspberry_pi_zero_w.jpg" alt="Raspberry Pi Zero W" width="200"/> | Running [Plantgateway](https://github.com/moostmartijn/homeassistant#raspberry-pi-zero-plantgateway) | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/google_home_mini.jpg" alt="Google Home Mini" width="200"/> | Controlling Home Assistant by voice |
| <b>Conbee II Zigbee USB Stick</b> | | <b>Klik Aan Klik Uit ACM-1000</b> | [More info](https://github.com/moostmartijn/homeassistant#rflink-gateway-arduino-mega) |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/conbee_ii_stick.jpg" alt="Conbee II Zigbee USB stick" width="200"/> | Zigbee hub to control Zigbee devices | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/kaku_acm_1000.jpg" alt="Klik Aan Klik Uit ACM-1000" width="200"/> | Acts as a smart switch |
| <b>Klik Aan Klik Uit ACM-LV10</b> | [More info](https://github.com/moostmartijn/homeassistant#rflink-gateway-arduino-mega) | <b>Xiaomi Aqara window/door sensor</b> | |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/kaku_acm_lv10.jpg" alt="Klik Aan Klik Uit ACM-LV10" width="200"/> | Controlling main ventilation unit | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/xiaomi_aqara_door_window_sensor.jpg" alt="Xiaomi Aqara window/door sensor" width="200"/> | Used to monitor received mail in mailbox |
| <b>Xiaomi Aqara temperature sensor</b> | | <b>Xiaomi Mi Flora plant monitor</b> |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/xiaomi_aqara_temperature_sensor.jpg" alt="Xiaomi Aqara temperature sensor" width="200"/> | I have three of them to track the temperature and humidity | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/xiaomi_mi_flora_plant_monitor.jpg" alt="Xiaomi Mi Flora plant monitor" width="200"/> | I have three of them to monitor plants |
| <b>ESP32-cam</b> | | <b>Broadlink RM3 Mini | [More info](https://github.com/moostmartijn/homeassistant#samsung-smart-tv-ue55ju6000)|
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/esp32-cam.jpg" alt="ESP32-cam" width="200"/> | Using this as a doorbell camera | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/broadlink-rm3-mini.jpg" alt="Broadlink RM3 Mini" width="200"/> | Controlling my 'dumb' smart-tv |
| <b>iRobot Roomba 960</b> | | <b>Samsung HW-MS650</b> | [More info](https://github.com/moostmartijn/homeassistant#sounbar-samsung-hw-ms650) |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/roomba_960.jpg" alt="iRobot Roomba 960" width="200"/> | Cleaning the house while I'm away | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/samsung_hw-ms650.jpg" alt="Samsung HW-MS650" width="200"/> | Main sound system |

## RFLink gateway (Arduino Mega)
### Klik Aan Klik Uit
To control my main ventilation unit in my house, the so called ComfoFanS, I use a ACL-LV10 Klik Aan Klik Uit (KAKU) device. The RFLink gateway sends a 433 mhz signal to control it.

Instead of a smart power outlet I use one KAKU ACM-1000 device to switch on my pick-up player using my voice and a Google Home Mini.

## Raspberry Pi Zero (Plantgateway)
### Xiaomi Mi Flora plant monitor sensors
I have three Xiaomi Mi Flora plant monirots to monitor two plants and an eco-system in a bottle. 

Because the Xiaomi plant sensors are too far away from the Raspberry Pi, they're not able to communicatie with eacht other through bluetooth. So solve this problem I installed [Plantgateway](https://github.com/ChristianKuehnel/plantgateway) on a Raspberry Pi Zero to send the sensor output over to Home Assistant using MQTT)

Whenever the moisture of a plant is below a certain percentage, Home Assistant will send me an iOS notification whenever I enter my home zone so I can water the plant when I come home. 

<br>[View my configuration of this automation in `/automations`](https://github.com/moostmartijn/homeassistant/blob/master/automations/ios/ios_moisture_howea_forsteriana.yaml)
<br>[View my configuration of the plants in `plants.yaml`](https://github.com/moostmartijn/homeassistant/blob/master/plants.yaml)
<br>[View my configuration of the plant monitor card in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/c8971cdf8f6bc1da83494fb637db72655925539a/ui-lovelace.yaml#L193-L200)


# 2. Add-ons
These are all the add-ons I'm runnung on my Raspberry Pi through Hass.io.

<br>[AdGuard Home](https://community.home-assistant.io/t/community-hass-io-add-on-adguard-home/90684)
<br>[ESPHome](https://esphome.io/)
<br>[Google Assistant webserver](https://community.home-assistant.io/t/community-hass-io-add-on-google-assistant-webserver-broadcast-messages-without-interrupting-music/37274)
<br>[Grafana](https://community.home-assistant.io/t/community-hass-io-add-on-grafana/54674)
<br>[InfluxDB](https://community.home-assistant.io/t/community-hass-io-add-on-influxdb/54491/9)
<br>[Node-RED](https://community.home-assistant.io/t/community-hass-io-add-on-node-red/55023)
<br>[Samba share](https://www.home-assistant.io/addons/samba/)
<br>[Spotify Connect](https://community.home-assistant.io/t/community-hass-io-add-on-spotify-connect/61210)
<br>[Wire Guard](https://community.home-assistant.io/t/community-hass-io-add-on-wireguard/134662)
<br>[deCONZ](https://github.com/home-assistant/hassio-addons/tree/master/deconz)

# 3. Frontend

## Custom Compact Header

To save space on my Home Assistant iPhone app I use the [Compact Custom Header](https://community.home-assistant.io/t/compact-custom-header/83716) community add-on.

![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/custom_compact_header.png "Compact Custom Header")

[View my configuration in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L47-L53)

## Home 
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_home.png "Home Tab")

## iRobot Roomba 960
I connected my Roomba 960 with Home Assistant so I can control this device through Home Assistant. I connected it by reading [these](https://github.com/koalazak/dorita980#how-to-get-your-usernameblid-and-password) instructions which worked very well for me.

## ComfoFanS
I have a main ventilation unit in my house called a ComfoFanS which has a main control unit in my living room. To control this unit through Home Assistant and bypass the main control unit in my living room, I installed a Klik Aan Klik Uit AMC-LV10 in the ventilation unit to control it using the Arduino Mega which acts as an RFlink gateway.

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L57-L280)

## Weather
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_weather.png "Weather Tab")

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L281-L462)

## Calendar
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_calendar.png "Calendar Tab")

### Last one at the door
This image shows the last snapshot that is taken from my front door camera, which gets triggered when someone pushes the doorbell button.

I made my dumb wired doorbell 'smart' through [this awesome guide](https://frenck.dev/diy-smart-doorbell-for-just-2-dollar/) of [Frenck](https://frenck.dev/).

## Camera
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_camera.png "Camera Tab")


## Music
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_music.png "Music Tab")

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L508-L666)

### Background
As seen a little bit in this picture, the background of the Home Assistant frontend shows the current playing track of Spotify using the community add-on [Lovelace Media Art Background](https://github.com/TheLastProject/lovelace-media-art-background)

### Spotify controls

[View the configuration of `spotify_controls.yaml` in `/packages`](https://github.com/moostmartijn/homeassistant/blob/master/packages/spotify_controls.yaml)


### Media players
For all my media players I use the '[Mini Media Player](https://github.com/kalkih/mini-media-player)' component. This component has a lot of features to customize. 

#### <br>Sounbar (Samsung HW-MS650)
To control some funcations of the Soundbar such as the volume, source and power buttons, I installed a component through HACS called [ha_samsung_multi_room](https://github.com/dariornelas/ha_samsung_multi_room)
#### <br>Samsung Smart TV (UE55JU6000)
Because this smart TV is not that smart, I use a [Broadlink RM Mini 3](https://www.banggood.com/nl/Broadlink-Black-Bean-Smart-Home-Wifi-Remote-IR-Controller-Universal-Appliances-Smart-Control-p-1049494.html?gmcCountry=NL&currency=EUR&createTmp=1&utm_source=googleshopping&utm_medium=cpc_bgs&utm_content=frank&utm_campaign=pla-nl-rm-all-0506&ad_id=346898361050&gclid=Cj0KCQjww7HsBRDkARIsAARsIT7IQkt374ke-nlRnJire91LPmSAOxkBxqBURcDsH6nF-EdY7HzwI_0aAmGmEALw_wcB&cur_warehouse=CN) to power the TV, change the source and staring Netflix and Plex using scripts toggled by voice using the Google Home Mini. 

[View these scripts in `/scripts/broadlink`](https://github.com/moostmartijn/homeassistant/tree/master/scripts/broadlink)

#### <br>Ziggo Mediabox Next

# 4. Automations

## Backups
I automate my backups using [Dropbox Sync](https://github.com/danielwelch/hassio-dropbox-sync) add-on, uploading my daily (full) snapshot to Dropbox. This upload to Dropbox is automaticly stored on my Synology DS718+, which keeps the last 5 snapshots and delete the other snapshots. 

[View my backup configuration in `/automation/backups`](https://github.com/moostmartijn/homeassistant/tree/master/automations/backups)

## Lights


<br>[Turn on the lights when someone comes home after sunset](/automations/lights/light_woonkamer_on_home_zone_sunset.yaml)
<br>[Turn on the hall lights for one minute whenever there is motion](https://github.com/moostmartijn/homeassistant/blob/master/automations/lights/light_gang_on_motion.yaml)

[View all light automations in `/automations/lights`](https://github.com/moostmartijn/homeassistant/tree/master/automations/lights)

## Mailbox
My mailbox is a few meters outside of my house and because I wanted to know when I received new mail, I installed a Xiamo window/door sensor on the lid. Whenever the mailman brings me mail and opens the lid, Home Assistant will send me an iOS notification. 

[View my mailbox configuration in `/automations/ios`](https://github.com/moostmartijn/homeassistant/blob/master/automations/ios/ios_brievenbus.yaml)

## iOS notifications

[View all iOS notification automations in `/automations/ios`](https://github.com/moostmartijn/homeassistant/tree/master/automations/ios)


## Radio
To play a radio station with just a few clicks, I use [`MultiRoom.sh`](https://github.com/moostmartijn/homeassistant/blob/master/multiroom/MultiRoom.sh) script. I favorited some radio stations in the Samsung Multiroom app. The script will play the selected radio station using the pre-installed multiroom software of the Samsung soundbar.

[View the configuration of radio automation in `/automations/radio`](https://github.com/moostmartijn/homeassistant/blob/master/automations/radio/radio_soundbar_favorites.yaml)

