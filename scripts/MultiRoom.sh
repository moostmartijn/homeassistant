#! /bin/bash

# Author: F. Hatz
#    based on 'https://github.com/bacl/WAM_API_DOC'
#    start with MultiRoom.sh search (search for speakers)
#       or with MultiRoom.sh Speaker-IP UUID OBJECTID [OBJECTID OBJECTID ...] volume
#       or with MultiRoom.sh Speaker-IP fav1/fav2/fav3/radio1/radio2/radio3 volume
#       or with MultiRoom.sh Speaker-IP play/pause/stop  (song: play/pause  radio: stop)
#       or with MultiRoom.sh Speaker-IP next/previous
#       or with MultiRoom.sh Speaker-IP mute on/off
#       or with MultiRoom.sh Speaker-IP volume
#       or with MultiRoom.sh Speaker-IP show title/id (show information of played song)
#       or with MultiRoom.sh Speaker-IP list (show uuid and objectid's of actual playlist)
#       or with MultiRoom.sh Speaker-IP presets all/fav1/fav2/fav3/radio1/radio2/radio3
#       or with MultiRoom.sh Speaker-IP name (speaker name)
#       or with MultiRoom.sh Speaker-IP soundshare (set input to soundshare = TV-connect)

PATH=/sbin:/usr/sbin:/bin:/usr/bin

CURL="/usr/bin/curl"
PORT="55001"

COMMAND=".."
VOLUME=".."
SPEAKER=".."

declare -a OBJECTID
OBJ_NUM=0
VAR_NUM=0
for i in "$@"; do
  VAR_NUM=$(($VAR_NUM+1))
  if [ $VAR_NUM -eq 1 ]  2>/dev/null ; then
      SPEAKER=$i
  elif [ $VAR_NUM -eq 2 ] ; then
    if [ "$i" -eq "$i" ]  2>/dev/null ; then
      COMMAND="volume"
      VOLUME=$i
    elif [ $(echo ${#i}) -gt 10 ]  2>/dev/null ; then
      COMMAND="song"
      UUID=$i
    else
      COMMAND="$i"
    fi
  elif [ $VAR_NUM -eq $# ]  2>/dev/null ; then
    if [ $(echo ${#i}) -lt 10 ]  2>/dev/null ; then
      VOLUME="$i"
    else
      OBJECTID["$OBJ_NUM"]="$i"
      OBJ_NUM=$(($OBJ_NUM+1))
    fi
  else
      OBJECTID["$OBJ_NUM"]="$i"
      OBJ_NUM=$(($OBJ_NUM+1))
  fi
done

if [ $SPEAKER == "search" ] ; then
    IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
    IP=${IP%.*}
    IP="$IP."
    IFS_BACK=$IFS
    IFS=$'\n'
    for i in {1..254}; do
      T_IP=$(echo "$IP$i")
      MSG="</dev/tcp/$T_IP/55001"
      timeout 0.2 bash -c $MSG 2>/dev/null
      if [ $? -eq 0 ]; then
        MSG="http://$T_IP:55001/UIC?cmd=%3Cname%3EGetSpkName%3C/name%3E"
        SPK_NAME=$($CURL $MSG -s) 
        SPK_NAME=($(echo "$SPK_NAME" | grep -oP "(?<=<spkname>)[^/]+"))
        SPK_NAME=${SPK_NAME##*[}
        SPK_NAME=${SPK_NAME%%]*} 
        echo "$T_IP: $SPK_NAME"
      fi
    done
    IFS=$IFS_BACK
    exit 1
fi

if [ "$VOLUME" -eq "$VOLUME" ] 2>/dev/null
then
   MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3ESetVolume%3C/name%3E%3Cp%20type=%22dec%22%20name=%22volume%22%20val=%22$VOLUME%22/%3E"
   $CURL $MSG -s >/dev/null
fi

case $COMMAND in
  stop)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlaybackControl%3C/name%3E%3Cp%20type=%22str%22%20name=%22playbackcontrol%22%20val=%22stop%22/%3E"
      $CURL $MSG -s >/dev/null
      ;;
  pause)
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cpwron%3Eon%3C/pwron%3E%3Cname%3ESetPlaybackControl%3C/name%3E%3Cp%20type=%22str%22%20name=%22playbackcontrol%22%20val=%22pause%22/%3E"
      $CURL $MSG -s >/dev/null
      ;;
  play)
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cpwron%3Eon%3C/pwron%3E%3Cname%3ESetPlaybackControl%3C/name%3E%3Cp%20type=%22str%22%20name=%22playbackcontrol%22%20val=%22resume%22/%3E"
      $CURL $MSG -s >/dev/null
      ;;
  next)
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cpwron%3Eon%3C/pwron%3E%3Cname%3ESetTrickMode%3C/name%3E%3Cp%20type=%22str%22%20name=%22trickmode%22%20val=%22next%22/%3E"
      $CURL $MSG -s >/dev/null
      ;;
  previous)
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cpwron%3Eon%3C/pwron%3E%3Cname%3ESetTrickMode%3C/name%3E%3Cp%20type=%22str%22%20name=%22trickmode%22%20val=%22previous%22/%3E"
      $CURL $MSG -s >/dev/null
      ;;
  mute)
      if [ "$VOLUME" == ".." ] 2>/dev/null ; then
        MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3EGetMute%3C/name%3E"
        MUTE=$($CURL $MSG -s)
        MUTE=($(echo "$MUTE" | grep -oP "(?<=<mute>)[^<]+"))
        if [ $MUTE == "off" ]; then
          VOLUME="on"
        else
          VOLUME="off"
        fi
      fi
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cpwron%3Eon%3C/pwron%3E%3Cname%3ESetMute%3C/name%3E%3Cp%20type=%22str%22%20name=%22mute%22%20val=%22$VOLUME%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Mute $VOLUME"
      ;;
  fav1)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%220%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%221%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Favorite 1"
      ;;       
  fav2)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%221%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%221%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Favorite 2"
      ;;       
  fav3)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%222%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%221%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Favorite 3"
      ;;       
  radio1)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%223%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 1"
      ;;       
  radio2)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%224%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 2"
      ;;       
  radio3)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%225%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 3"
      ;;
  radio4)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%226%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 4"
      ;;      
  radio5)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%227%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 5"
      ;;
  radio6)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%228%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 6"
      ;;
  radio7)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3ESetPlayPreset%3C/name%3E%3Cp%20type=%22dec%22%20name=%22presetindex%22%20val=%229%22/%3E%3Cp%20type=%22dec%22%20name=%22presettype%22%20val=%220%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Play Radio 7"
      ;;

  song)
      count=0
      for i in ${!OBJECTID[*]} ; do
          ID="${OBJECTID[$i]}"
          if [ "$i" -eq 0 ]  2>/dev/null ; then
              MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3ESetNewPlaylistPlaybackControl%3C%2Fname%3E%3Cp%20type%3D%22dec%22%20name%3D%22selcount%22%20val%3D%221%22%2F%3E%3Cp%20type%3D%22dec%22%20name%3D%22playtime%22%20val%3D%220%22%2F%3E%3Cp%20type%3D%22str%22%20name%3D%22type%22%20val%3D%22new%22%2F%3E%3Cp%20type%3D%22str%22%20name%3D%22device_udn%22%20val%3D%22uuid%3A$UUID%22%2F%3E%3Cp%20type%3D%22str%22%20name%3D%22objectid%22%20val%3D%22$ID%22%2F%3E%3Cp%20type%3D%22cdata%22%20name%3D%22songtitle%22%20val%3D%22empty%22%3E%3C!%5BCDATA%5BSong%201%5D%5D%3E%3C%2Fp%3E%3Cp%20type%3D%22cdata%22%20name%3D%22thumbnail%22%20val%3D%22empty%22%3E%3C!%5BCDATA%5B%5D%5D%3E%3C%2Fp%3E%3Cp%20type%3D%22cdata%22%20name%3D%22artist%22%20val%3D%22empty%22%3E%3C!%5BCDATA%5B%5D%5D%3E%3C%2Fp%3E"
              $CURL $MSG -s >/dev/null
          else
              SONG_N=$(($i+1))
              MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3EAddSongsToMultiQueue%3C%2Fname%3E%3Cp%20type%3D%22dec%22%20name%3D%22count%22%20val%3D%221%22%2F%3E%3Cp%20type%3D%22dec%22%20name%3D%22totalcount%22%20val%3D%221%22%2F%3E%3Cp%20type%3D%22str%22%20name%3D%22position%22%20val%3D%22last%22%2F%3E%3Cp%20type%3D%22str%22%20name%3D%22device_udn%22%20val%3D%22uuid%3A$UUID%22%2F%3E%3Cp%20type%3D%22str%22%20name%3D%22objectid%22%20val%3D%22$ID%22%2F%3E%3Cp%20type%3D%22cdata%22%20name%3D%22songtitle%22%20val%3D%22empty%22%3E%3C!%5BCDATA%5BSong%20$SONG_N%5D%5D%3E%3C%2Fp%3E%3Cp%20type%3D%22cdata%22%20name%3D%22thumbnail%22%20val%3D%22empty%22%3E%3C!%5BCDATA%5B%5D%5D%3E%3C%2Fp%3E%3Cp%20type%3D%22cdata%22%20name%3D%22artist%22%20val%3D%22empty%22%3E%3C!%5BCDATA%5B%5D%5D%3E%3C%2Fp%3E"
              $CURL $MSG -s >/dev/null
          fi
          count=$(( $count + 1 ))
      done
      if [ "$count" -eq 1 ] ; then
          echo "Play Song"
      elif [ "$count" -gt 1 ] ; then
          echo "Play List with $count songs"
      fi      
      ;;
  volume)
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3ESetVolume%3C/name%3E%3Cp%20type=%22dec%22%20name=%22volume%22%20val=%22$VOLUME%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Volume $VOLUME"
      ;; 
  show)
      IFS_BACK=$IFS
      IFS=$'\n'
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3EGetMusicInfo%3C/name%3E"
      SONG=$($CURL $MSG -s)
      SONG_T=($(echo "$SONG" | grep -oP "(?<=<title>)[^/]+"))
      if [ -n "${SONG_T}" ]; then
        SONG_T=${SONG_T##*[}
        SONG_T=${SONG_T%%]*} 
        SONG_A=($(echo "$SONG" | grep -oP "(?<=<artist>)[^/]+"))
        SONG_A=${SONG_A##*[}
        SONG_A=${SONG_A%%]*} 
        SONG_UUID=($(echo "$SONG" | grep -oP "(?<=<device_udn>)[^<]+"))
        SONG_UUID=${SONG_UUID##*:} 
        SONG_OID=($(echo "$SONG" | grep -oP "(?<=<objectid>)[^/]+"))
        SONG_OID=${SONG_OID##*[}
        SONG_OID=${SONG_OID%%]*} 
        if [ $VOLUME == "id" ] ; then
          echo "$SONG_UUID $SONG_OID"
          exit 1
        elif [ $VOLUME == "title" ] ; then
          echo "$SONG_T - $SONG_A"
          exit 1
        else
          echo "$SONG_T - $SONG_A (uuid: $SONG_UUID / objectid: $SONG_OID)"
        fi
      fi
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3EGetRadioInfo%3C/name%3E"
      RADIO=$($CURL $MSG -s)
      RADIO_T=($(echo "$RADIO" | grep -oP "(?<=<title>)[^<]+"))
      if [ -n "${RADIO_T}" ]; then
        echo "$RADIO_T"
      fi
      IFS=$IFS_BACK
      ;; 
  presets)
      MSG="http://$SPEAKER:$PORT/CPM?cmd=%3Cname%3EGetPresetList%3C/name%3E%3Cp%20type=%22dec%22%20name=%22startindex%22%20val=%220%22/%3E%3Cp%20type=%22dec%22%20name=%22listcount%22%20val=%22100%22/%3E"
      PRESETS=$($CURL $MSG -s)
      IFS_BACK=$IFS
      IFS=$'\n'
      TITLES=($(echo "$PRESETS" | grep -oP "(?<=<title>)[^<]+"))
      if [ $VOLUME == "fav1" ]; then
          echo "${TITLES[0]}"
      elif [ $VOLUME == "fav2" ]; then
          echo "${TITLES[1]}"
      elif [ $VOLUME == "fav3" ]; then
          echo "${TITLES[2]}"
      elif [ $VOLUME == "radio1" ]; then
          echo "${TITLES[3]}"
      elif [ $VOLUME == "radio2" ]; then
          echo "${TITLES[4]}"
      elif [ $VOLUME == "radio3" ]; then
          echo "${TITLES[5]}"
      elif [ $VOLUME == "radio4" ]; then
          echo "${TITLES[6]}"
      else
          echo "---------Favorites---------"
          for i in ${!TITLES[*]}
            do
            if [ $i \= 3 ]
            then
              echo "---------Radio-------------"
            fi
            if [ $i \< 3 ] 2>/dev/null
            then
              let j=$i+1
              echo "Favorite $j: ${TITLES[$i]}" 
            else
              let j=$i-2
              echo "Preset $j: ${TITLES[$i]}" 
            fi
          done
      fi 
      IFS=$IFS_BACK 
      ;;
  list)
      IFS_BACK=$IFS
      IFS=$'\n'
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3EGetCurrentMultiQueuelist%3C/name%3E%3Cp%20type=%22dec%22%20name=%22liststartindex%22%20val=%220%22/%3E%3Cp%20type=%22dec%22%20name=%22listcount%22%20val=%22100%22/%3E"
      LIST=$($CURL $MSG -s)
      UUID=($(echo "$LIST" | grep -oP "(?<=uuid:)[^<]+"))
      TITLES=($(echo "$LIST" | grep -oP "(?<=object_id)[^>]+"))
      LIST="$UUID"
      for i in ${!TITLES[*]} ; do
         T=${TITLES[$i]} 
         T_L=${#T}-3
         T=${T:2:T_L}
         LIST="$LIST $T"  
      done
      echo "$LIST"
      IFS=$IFS_BACK 
      ;;
  name)
      IFS_BACK=$IFS
      IFS=$'\n'
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3EGetSpkName%3C/name%3E"
      SPK_NAME=$($CURL $MSG -s)
      SPK_NAME=($(echo "$SPK_NAME" | grep -oP "(?<=<spkname>)[^>]+"))
      SPK_NAME=${SPK_NAME##*[}
      SPK_NAME=${SPK_NAME%%]*} 
      echo "$SPK_NAME"
      IFS=$IFS_BACK
      ;;
  soundshare)
      MSG="http://$SPEAKER:$PORT/UIC?cmd=%3Cname%3ESetFunc%3C/name%3E%3Cp%20type=%22str%22%20name=%22function%22%20val=%22soundshare%22/%3E"
      $CURL $MSG -s >/dev/null
      echo "Input: TV-Connect"
      ;;
  *)
      echo "Usage: Error - $COMMAND" >&2
      ;;
esac

exit 1