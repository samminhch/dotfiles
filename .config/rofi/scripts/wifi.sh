#!/bin/zsh
# This script provides a rofi menu interface for wifi control
# It uses and requires nmcli

get_match() {
    selection=$(echo -e "$1" | rofi -dmenu -mesg "$2" -location 3 -no-show-icons -theme-str "@import '$HOME/.config/rofi/scripts/wifi-theme'")
    [[ -z "$selection" ]] && exit 1
    does_match_=$(echo -e "$1" | grep "$selection")
    [[ -n "$1" ]] && [[ -z "$does_match_" ]] && exit 1
    echo "$selection"
}

get_connections() {
    notify-send -t 2000 "Rofi-WiFi" "Scanning for networks, please wait a bit!"
    fields="BARS,SSID,SECURITY"
    scanned_connections=$(nmcli -g $fields dev wifi list --rescan yes | 
                 sed "s/▂▄▆█/󰤨/g" | 
                 sed "s/▂▄▆_/󰤥/g" | 
                 sed "s/▂▄__/󰤢/g" | 
                 sed "s/▂___/󰤟/g" | 
                 sed "s/____/󰤯/g" | 
                 sed '/WPA\|WEP\|WPA2/ s/󰤨/󰤪/g' |
                 sed '/WPA\|WEP\|WPA2/ s/󰤥/󰤧/g' |
                 sed '/WPA\|WEP\|WPA2/ s/󰤢/󰤤/g' |
                 sed '/WPA\|WEP\|WPA2/ s/󰤟/󰤡/g' |
                 sed '/WPA\|WEP\|WPA2/ s/󰤯/󰤬/g')

    echo "$scanned_connections"
}


wifi_state=$(nmcli -fields WIFI g | grep "enabled")
wifi_toggle="󱛅  Disable WiFi"
create_connection="󱛃  Create Connection"
refresh_connections="󱛄  Refresh Connections"

if [ -z $wifi_state ]; then
    toggle="󱚽  Enable WiFi"
    selection=$(get_match "Yes\nNo" "Enable WiFi")
    if [ "$selection" = "Yes" ]; then
        nmcli radio wifi on
    fi
    exit 0
fi

flag=true
while $flag;
do

    scanned_connections=$(get_connections)
    display_connections=$(echo -e "$scanned_connections"| 
                          awk -F ":" '{print $1"  "$2}')

    selection=$(get_match "$wifi_toggle\n$refresh_connections\n$create_connection\n$display_connections" "Choose an Option" )
    selected_text=$(echo -e "$selection" | sed 's/.*  //g')

    if [ "$selection" = "$create_connection" ]; then
        nm-connection-editor -c
        exit 0
    elif [ "$selection" = "󱚽  Enable WiFi" ]; then
        nmcli radio wifi on
        flag=false
    elif [ "$selection" = "󱛅  Disable WiFi" ]; then
        nmcli radio wifi off
        flag=false
    elif [ "$selection" = "󱛄  Refresh Connections" ]; then
        flag=true
    elif [ -n "$selected_text" ]; then
        if [ -n "$(echo -e "$(nmcli con show)" | grep "$selected_text")" ]; then
            nmcli con up "$selected_text"
            exit 0
        fi
        selection=$(echo -e "$selection" | sed "s/  /:/g")
        security=$(echo -e "$scanned_connections" | grep "$selection" | awk -F ":" '{print $NF}')        

        notify-send "$security"
        flag=false
    else
        flag=false
    fi

done
