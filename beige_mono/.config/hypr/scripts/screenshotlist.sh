#!/bin/bash

# Toggle
if pgrep -x wofi; then
    killall wofi
    exit 0
fi

# Area Selection
choice1=$( echo -e "Fullscreen\nSelection" | wofi -i --dmenu -c "$HOME"/.config/wofi/screenshotconfig | awk '{print tolower($1)}' )
# Quit on cancel
if [ -z "$choice1" ]; then
    exit 0
fi
mode="screen"
waittime=0.3
case $choice1 in 
    fullscreen)
        mode="screen"
        ;;
    selection)
        mode="area"
        ;;
esac

# Mode selection
choice2=$( echo -e "Screenshot\nScreencast" | wofi -i --dmenu -c "$HOME"/.config/wofi/screenshotconfig | awk '{print tolower($1)}' )
# Quit on cancel:
if [ -z "$choice2" ]; then
    exit 0
fi
case $choice2 in 
    screenshot)
        # Screenshot details
        choice3=$( echo -e "Copy to clipboard\nSave to file\nBoth (copy and save)\nEdit" | wofi -i --dmenu -c "$HOME"/.config/wofi/screenshotconfig | awk '{print tolower($1)}' )
        # Quit on cancel:
        if [ -z "$choice3" ]; then
            exit 0
        fi
        savemethod="copy"
        path="$HOME/Pictures/Screenshots/"
        prefix="screenshot_"
        filedate=$(date +"%G-%m-%d_%H-%M-%S")
        suffix=".png"
        filename=$path$prefix$filedate$suffix
        case $choice3 in 
            copy)
                savemethod="copy"
                ;;
            save)
                touch "$filename"
                savemethod="save"
                ;;
            both)
                touch "$filename"
                savemethod="copysave"
                ;;
            edit)
                touch "$filename"
                savemethod="edit"
                ;;
        esac
        # Execution
        sleep $waittime
        grimblast --notify $savemethod $mode "$filename"
        play "$HOME"/.config/hypr/scripts/screenshot-sound.mp3
        ;;

    screencast)
        # Screencast details
        choice3=$( echo -e "Audio\nNo Audio" | wofi -i --dmenu -c "$HOME"/.config/wofi/screenshotconfig | awk '{print tolower($1)}' )
        # Quit on cancel
        if [ -z "$choice3" ]; then
            exit 0
        fi
        audiomode=""
        case $choice3 in 
            audio)
                audiomode="-a"
                ;;
            no)
                audiomode=""
                ;;
        esac
        path="$HOME/Videos/wf-recorder/"
        prefix="screencast_"
        filedate=$(date +"%G-%m-%d_%H-%M-%S")
        suffix=".mp4"
        filename=$path$prefix$filedate$suffix

        if [[ "$mode" == "area" ]]; then
            # disable animation for layer namespace "selection" (slurp)
            # this removes the black border seen around screenshots
            hyprctl keyword layerrule "noanim,selection" >/dev/null
            FULLSCREEN_WORKSPACES="$(hyprctl workspaces -j | jq -r 'map(select(.hasfullscreen) | .id)')"
            WORKSPACES="$(hyprctl monitors -j | jq -r '[(foreach .[] as $monitor (0; if $monitor.specialWorkspace.name == "" then $monitor.activeWorkspace else $monitor.specialWorkspace end)).id]')"
            WINDOWS="$(hyprctl clients -j | jq -r --argjson workspaces "$WORKSPACES" --argjson fullscreenWorkspaces "$FULLSCREEN_WORKSPACES" 'map((select(([.workspace.id] | inside($workspaces)) and ([.workspace.id] | inside($fullscreenWorkspaces) | not) or .fullscreen > 0)))')"
            # shellcheck disable=2086 # if we don't split, spaces mess up slurp
            GEOM=$(echo "$WINDOWS" | jq -r '.[] | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | slurp)
            # Check if user exited slurp without selecting the area
            if [ -z "$GEOM" ]; then
                exit 1
            fi
            sleep $waittime
            foot -T screencast -e wf-recorder $audiomode -f "$filename" -g "$GEOM"
        else
            GEOM=$(hyprctl monitors -j | jq -r '.[] | "\(.x),\(.y) \(.width)x\(.height)"')
            sleep $waittime
            foot -T screencast -e wf-recorder $audiomode -f "$filename" -g "$GEOM"
        fi
        ;;
esac
