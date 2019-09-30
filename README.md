# Home Assistant configuration
I've been running Home Assistant under Hass.io on a Raspberry Pi 3b+ since february 2019. Since then I'm adding more and more (hardware) sensors to the configuration to make my home as 'smart' or 'connected' as possible. 

I like to have a nice looking frontend which I use to control and view all of my sensors, media players and other integrations of Home Assistant. 

Use these links to go directly to the topics you want to read:
1. [Hardware](https://github.com/moostmartijn/homeassistant#1-hardware)
2. [Add-ons](https://github.com/moostmartijn/homeassistant#2-add-ons)
3. [Frontend](https://github.com/moostmartijn/homeassistant#3-frontend)
    * [Home tab](https://github.com/moostmartijn/homeassistant#home)
    * [Weather tab](https://github.com/moostmartijn/homeassistant#weather)
    - [Calendar tab](https://github.com/moostmartijn/homeassistant#calendar)
    - [Music tab](https://github.com/moostmartijn/homeassistant#music)
    - [Camera tab](https://github.com/moostmartijn/homeassistant#camera)    
    - [System information](https://github.com/moostmartijn/homeassistant#system-information)
4. [Automations](https://github.com/moostmartijn/homeassistant#4-automations)


# 1. Hardware

These are all of my hardware devices and sensors I have connected to Home Assistant.

| Raspberry Pi 3b+ | Description | Arduino Mega | [More info](https://github.com/moostmartijn/homeassistant#rflink-gateway-arduino-mega) |
| ---------|-------------|----------|-------------|
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/raspberry_pi_3b.jpg" alt="Raspberry Pi 3b+" width="200"/> | Running Hass.io | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/arduino_mega.jpg" alt="Arduino Mega" width="200"/> | RFlink gateway host |
| <b>Raspberry Pi Zero W</b> | [More info](https://github.com/moostmartijn/homeassistant#raspberry-pi-zero-plantgateway) | <b>Google Home Mini</b> | |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/raspberry_pi_zero_w.jpg" alt="Raspberry Pi Zero W" width="200"/> | Running [Plantgateway](https://github.com/moostmartijn/homeassistant#raspberry-pi-zero-plantgateway) | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/google_home_mini.jpg" alt="Google Home Mini" width="200"/> | Controlling Home Assistant by voice |
| <b>Conbee II Zigbee USB Stick</b> | | <b>Klik Aan Klik Uit ACM-1000</b> | [More info](https://github.com/moostmartijn/homeassistant#rflink-gateway-arduino-mega) |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/conbee_ii_stick.jpg" alt="Conbee II Zigbee USB stick" width="200"/> | Zigbee hub to control Zigbee devices | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/kaku_acm_1000.jpg" alt="Klik Aan Klik Uit ACM-1000" width="200"/> | Acts as a smart switch |
| <b>Klik Aan Klik Uit ACM-LV10</b> | [More info](https://github.com/moostmartijn/homeassistant#comfofans) | <b>Xiaomi Aqara window/door sensor</b> | [More info](https://github.com/moostmartijn/homeassistant#mailbox) |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/kaku_acm_lv10.jpg" alt="Klik Aan Klik Uit ACM-LV10" width="200"/> | Controlling main ventilation unit | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/xiaomi_aqara_door_window_sensor.jpg" alt="Xiaomi Aqara window/door sensor" width="200"/> | Used to monitor received mail in mailbox |
| <b>Xiaomi Aqara temperature sensor</b> | | <b>Xiaomi Mi Flora plant monitor</b> |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/xiaomi_aqara_temperature_sensor.jpg" alt="Xiaomi Aqara temperature sensor" width="200"/> | I have three of them to track the temperature and humidity | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/xiaomi_mi_flora_plant_monitor.jpg" alt="Xiaomi Mi Flora plant monitor" width="200"/> | I have three of them to monitor plants |
| <b>ESP32-cam</b> | [More info](https://github.com/moostmartijn/homeassistant#camera) | <b>Broadlink RM3 Mini | [More info](https://github.com/moostmartijn/homeassistant#samsung-smart-tv-ue55ju6000)|
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/esp32-cam.jpg" alt="ESP32-cam" width="200"/> | Using this as a doorbell camera | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/broadlink-rm3-mini.jpg" alt="Broadlink RM3 Mini" width="200"/> | Controlling my 'dumb' smart-tv |
| <b>iRobot Roomba 960</b> | [More info](https://github.com/moostmartijn/homeassistant#irobot-roomba-960) | <b>Samsung HW-MS650</b> | [More info](https://github.com/moostmartijn/homeassistant#sounbar-samsung-hw-ms650) |
| <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/roomba_960.jpg" alt="iRobot Roomba 960" width="200"/> | Cleaning the house while I'm away | <img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/samsung_hw-ms650.jpg" alt="Samsung HW-MS650" width="200"/> | Main sound system |


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

### Custom Compact Header

To save space on my Home Assistant iPhone app I use the [Compact Custom Header](https://community.home-assistant.io/t/compact-custom-header/83716) community add-on.

![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/custom_compact_header.png "Compact Custom Header")

[View my configuration in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L47-L53)

## Home 
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_home.png "Home Tab")

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L57-L280)

### iRobot Roomba 960
I connected my Roomba 960 with Home Assistant so I can control this device through Home Assistant. I connected it by reading [these](https://github.com/koalazak/dorita980#how-to-get-your-usernameblid-and-password) instructions which worked very well for me.

### ComfoFanS
I have a main ventilation unit in my house called a ComfoFanS which has a main control unit in my living room. To control this unit through Home Assistant and bypass the main control unit in my living room, I installed a Klik Aan Klik Uit ACM-LV10 in the ventilation unit to control it using the Arduino Mega which acts as an RFlink gateway. The RFlink gateway sends a 433 mhz signal to the ACM-LV10 which sets the speed of the ComfoFanS.

### DSMR (Smart meter)
My Smart meter is connected with a USB (P1) to Home Assistant. It oututs multiple sensors such as power and gas usage. I show these in my frontend in a ['mini graph card'](https://github.com/kalkih/mini-graph-card) so I can monitor power and gas usage in the last 24 hours.

### Plants (Raspberry Pi Zero W running 'Plantgateway')
I monitor my plants using three Xiaomi Mi Flora plant monitor sensors. Because the bluetooth of the Raspberry Pi 3b+ can't reach all the plant monitors, I use a Raspberry Pi Zero W running ['Plantgateway'](https://github.com/ChristianKuehnel/plantgateway) which is placed in my living room.

The Raspberry Pi Zero W connects with the plan monitors over bluetooth and sends the information to Home Assistant on the Raspberry Pi 3b+ over MQTT.

Whenever the moisture of a plant is below a certain percentage, Home Assistant will send me an iOS notification whenever I enter my home zone so I can water the plant when I come home. 

<br>[View my configuration of this automation in `/automations`](https://github.com/moostmartijn/homeassistant/blob/master/automations/ios/ios_moisture_howea_forsteriana.yaml)
<br>[View my configuration of the plants in `plants.yaml`](https://github.com/moostmartijn/homeassistant/blob/master/plants.yaml)
<br>[View my configuration of the plant monitor card in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/c8971cdf8f6bc1da83494fb637db72655925539a/ui-lovelace.yaml#L193-L200)


## Weather
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_weather.png "Weather Tab")

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L281-L462)

This tab shows a camera image of the [Buienradar](https://www.home-assistant.io/components/buienradar/) radar, the [animated weather card](https://community.home-assistant.io/t/custom-animated-weather-card-for-lovelace/58338) with information of a the current weather from the nearest weather station, battery information of some of my hardware devices, garbage pick-up dates, a [PostNL card](https://community.home-assistant.io/t/lovelace-postnl/112433) and the three Xiaomi temperature / humidity sensors.


## Calendar
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_calendar.png "Calendar Tab")

[View the configuration of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/3daad5355fdfe9f84950400a8bf3bd6cbcfbd427/ui-lovelace.yaml#L463-L670)

### Last one at the door
This image shows the last snapshot that is taken from my front door camera, which gets triggered when someone pushes the doorbell button.

I made my dumb wired doorbell 'smart' through [this awesome guide](https://frenck.dev/diy-smart-doorbell-for-just-2-dollar/) of [Frenck](https://frenck.dev/).

If there's no snapshot to show after a re-start of Home Assistant, it will show this doorbell image.

### Shopping list
I love the Shopping list of Home Assistant. I keep this shopping list up to date with items I need from the local store. Whenever I enter the zone of my local supermarket, Home Assistant sends me the shopping list to my iPhone.

I created a custom sensor with `shopping_list.py`, a Python script I found on the Home Assistant [comminity forum](https://community.home-assistant.io/)

I also created an iOS actionable notification with a button to complete all the items on my shopping list

[View the configuration of this automation in `automations.yaml`](https://github.com/moostmartijn/homeassistant/blob/master/automations/ios/actionable/ios_actionable_empty.yaml)

### Calendar
For the calandar card, I use a community add-on called ['Atomic Calendar'](https://github.com/atomic7777/atomic_calendar) which I installed using [HACS](https://community.home-assistant.io/t/custom-component-hacs/121727). 

### Reddit
Integrated Reddit into Home Assistant using the [Reddit card](https://github.com/ljmerza/reddit-card) installed with [HACS](https://community.home-assistant.io/t/custom-component-hacs/121727), showing the five newest topics posted in the Home Assistant subreddit. 


## Music
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_music.png "Music Tab")

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/24ae1f1d3eca1799e006e653466a77e4b246ffae/ui-lovelace.yaml#L508-L666)


## Camera
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_camera.png "Camera Tab")

[View the configuraton of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/cca1cca81f5a816765e9f3cc08707d464a98700e/ui-lovelace.yaml#L671-L742)


## System information
![alt text](https://github.com/moostmartijn/homeassistant/blob/master/docs/images/tab_system_information.png "System information tab")

[View the configuration of this tab in `ui-lovelace.yaml`](https://github.com/moostmartijn/homeassistant/blob/32e91244fb5b7dbb70dd0f5cc75cf61047935115/ui-lovelace.yaml#L743-L828)

This tab shows the system information of the Raspberry Pi 3b+ running Home Assistant, of SabNZBD, AdGuard Home and has a frontend Home Assistant re-start button.

### Background
As seen a little bit in this picture, the background of the Home Assistant frontend shows the current playing track of Spotify using the community add-on [Lovelace Media Art Background](https://github.com/TheLastProject/lovelace-media-art-background)


### Spotify controls
[View the configuration of `spotify_controls.yaml` in `/packages`](https://github.com/moostmartijn/homeassistant/blob/master/packages/spotify_controls.yaml)


### Media players
For all my media players I use the '[Mini Media Player](https://github.com/kalkih/mini-media-player)' component. This component has a lot of features to customize. 

#### <br>Sounbar (Samsung HW-MS650)
To control some funcations of the Soundbar such as the volume, source and power buttons, I installed a component with [HACS](https://community.home-assistant.io/t/custom-component-hacs/121727) called [ha_samsung_multi_room](https://github.com/dariornelas/ha_samsung_multi_room)

#### <br>Samsung Smart TV (UE55JU6000)
Because this smart TV is not that smart, I use a [Broadlink RM Mini 3](https://www.banggood.com/nl/Broadlink-Black-Bean-Smart-Home-Wifi-Remote-IR-Controller-Universal-Appliances-Smart-Control-p-1049494.html?gmcCountry=NL&currency=EUR&createTmp=1&utm_source=googleshopping&utm_medium=cpc_bgs&utm_content=frank&utm_campaign=pla-nl-rm-all-0506&ad_id=346898361050&gclid=Cj0KCQjww7HsBRDkARIsAARsIT7IQkt374ke-nlRnJire91LPmSAOxkBxqBURcDsH6nF-EdY7HzwI_0aAmGmEALw_wcB&cur_warehouse=CN) to power the TV, change the source and staring Netflix and Plex using scripts toggled by voice using the Google Home Mini. 

[View these scripts in `/scripts/broadlink`](https://github.com/moostmartijn/homeassistant/tree/master/scripts/broadlink)

#### <br>Ziggo Mediabox Next
Most of the functions of the Ziggo Mediabox Next I can control through Home Assistant thanks to a [community add-on](https://github.com/IIStevowII/ziggo-mediabox-next) of IIStevowII. 

### Record player switch
I placed a Klik Aan Klik Uit AMC-1000 between the power outlet and my record player (Technics SL-1210) so I can switch on the record player using Home Assistant or with my voice using the Google Home mini.

### Discogs sensor
I set up a Disocgs sensor, which shows a random record every 10 minutes out of my Discogs collection. So if I'm not sure what to play, Home Assistant helps me to pick a record.

To show the artist, title, label, catalog number and release date, I made a custom sensor.

[View the custom sensor in `sensors.yaml`](https://github.com/moostmartijn/homeassistant/blob/edfe3cc7cbc891c2c9afb826639cbaf931ec5601/sensors.yaml#L376-L380)

# 4. Automations

## Backups
I automate my backups using [Dropbox Sync](https://github.com/danielwelch/hassio-dropbox-sync) add-on, uploading my daily (full) snapshot to Dropbox. This upload to Dropbox is automaticly stored on my Synology DS718+, which keeps the last 5 snapshots and delete the other snapshots. 

[View my backup configuration in `/automation/backups`](https://github.com/moostmartijn/homeassistant/tree/master/automations/backups)

## Lights

<br>[Turn on the lights when someone comes home after sunset](/automations/lights/light_woonkamer_on_home_zone_sunset.yaml)
<br>[Turn on the hall lights for one minute whenever there is motion](https://github.com/moostmartijn/homeassistant/blob/master/automations/lights/light_gang_on_motion.yaml)

[View all light automations in `/automations/lights`](https://github.com/moostmartijn/homeassistant/tree/master/automations/lights)

## Mailbox
My mailbox is a few meters outside of my house and because I wanted to know when I received new mail, I installed a Xiaomi window/door sensor on the lid. Whenever the mailman brings me mail and opens the lid, Home Assistant will send me an iOS notification. 

[View my mailbox configuration in `/automations/ios`](https://github.com/moostmartijn/homeassistant/blob/master/automations/ios/ios_brievenbus.yaml)

## iOS notifications

[View all iOS notification automations in `/automations/ios`](https://github.com/moostmartijn/homeassistant/tree/master/automations/ios)


#### Actionable notifications
At the moment I have just two actionable notifications running. One to complete all items on my shopping list ([link](https://github.com/moostmartijn/homeassistant#shopping-list)) and one that monitors for how long the lights in the bedroom are on. When they're on for more than 30 minutes, Home Assistant sends me a notification with a button to turn the lihts off or to keep them on.

<img src="https://github.com/moostmartijn/homeassistant/blob/master/docs/images/ios_actionable_shopping_list.jpg" alt="Actionable iOS notification - Empty shopping list" width="200"/>

<br>[View the automation that sends the actionable notification](https://github.com/moostmartijn/homeassistant/blob/master/automations/ios/ios_light_slaapkamer_off.yaml)
<br>[View all the actionable notification in `automations/ios/actionable](https://github.com/moostmartijn/homeassistant/tree/master/automations/ios/actionable)

## Radio
To play a radio station with just a few clicks, I use [`MultiRoom.sh`](https://github.com/moostmartijn/homeassistant/blob/master/multiroom/MultiRoom.sh) script. I favorited some radio stations in the Samsung Multiroom app. The script will play the selected radio station using the pre-installed multiroom software of the Samsung soundbar.

[View the configuration of radio automation in `/automations/radio`](https://github.com/moostmartijn/homeassistant/blob/master/automations/radio/radio_soundbar_favorites.yaml)

