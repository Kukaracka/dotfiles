#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi menu for KooL Hyprland Quick Settings (SUPER SHIFT E)

# Modify this config file for default terminal and EDITOR
config_file="$HOME/.config/hypr/custom/env.conf"

tmp_config_file=$(mktemp)
sed 's/^\$//g; s/ = /=/g' "$config_file" > "$tmp_config_file"
source "$tmp_config_file"
# ##################################### #

# variables
# configs="$HOME/.config/hypr/configs"
hyprdir="$HOME/.config/hypr" 

UserConfigs="$HOME/.config/hypr/custom"
Configs="$HOME/.config/hypr/hyprland"
rofi_theme="$HOME/.config/rofi/config-edit.rasi"
msg=' ⁉️ Choose what to do ⁉️'
iDIR="$HOME/.config/swaync/images"
scriptsDir="$HOME/.config/hypr/scripts"
UserScripts="$HOME/.config/hypr/custom/scripts"

# Function to display the menu options without numbers
menu() {
    cat <<EOF
view/edit User env
view/edit User execs
view/edit User general
view/edit User keybinds
view/edit User rules
view/edit User windowrules
view/edit env
view/edit execs
view/edit general
view/edit keybinds
view/edit rules
view/edit colors
view/edit keyd config
view/edit fish config
view/edit GRUB config
Configure Monitors (nwg-displays)
GTK Settings (nwg-look)
QT Apps Settings (qt6ct)
QT Apps Settings (qt5ct)
Hyprland directory
Configs directory
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu -config $rofi_theme -mesg "$msg")
    
    # Map choices to corresponding files
    case "$choice" in
        "view/edit User env") file="$UserConfigs/env.conf" directory=$hyprdir ;;
        "view/edit User execs") file="$UserConfigs/execs.conf" directory=$hyprdir;;
        "view/edit User general") file="$UserConfigs/general.conf" directory=$hyprdir;;
        "view/edit User keybinds") file="$UserConfigs/keybinds.conf" directory=$hyprdir;;
        "view/edit User rules") file="$UserConfigs/rules.conf" directory=$hyprdir;;
        "view/edit User windowrules") file="$UserConfigs/windowrules.conf" directory=$hyprdir;;


        "view/edit env") file="$Configs/env.conf" directory=$hyprdir;;
        "view/edit execs") file="$Configs/execs.conf" directory=$hyprdir;;
        "view/edit general") file="$Configs/general.conf" directory=$hyprdir;;
        "view/edit keybinds") file="$Configs/keybinds.conf" directory=$hyprdir;;
        "view/edit rules") file="$Configs/rules.conf" directory=$hyprdir;;
        "view/edit colors") file="$Configs/colors.conf" directory=$hyprdir;;

        "view/edit keyd config") file="/etc/keyd/default.conf" directory="/etc/keyd";;
        "view/edit GRUB config") file="/etc/default/grub" directory="/etc/default";;
        "view/edit fish config") file="$HOME/.config/fish/config.fish" directory="$HOME/.config/fish";;

        "Hyprland directory") directory="/home/kukaracka/.config/hypr" ;;
        "Configs directory") directory="/home/kukaracka/.config" ;;

        # "Choose Kitty Terminal Theme") $scriptsDir/Kitty_themes.sh ;;
        "Configure Monitors (nwg-displays)") 
            if ! command -v nwg-displays &>/dev/null; then
                notify-send -i "$iDIR/error.png" "E-R-R-O-R" "Install nwg-displays first"
                exit 1
            fi
            nwg-displays ;;
        # "Configure Workspace Rules (nwg-displays)") 
        #     if ! command -v nwg-displays &>/dev/null; then
        #         notify-send -i "$iDIR/error.png" "E-R-R-O-R" "Install nwg-displays first"
        #         exit 1
        #     fi
            # nwg-displays ;;
		"GTK Settings (nwg-look)") 
            if ! command -v nwg-look &>/dev/null; then
                notify-send -i "$iDIR/error.png" "E-R-R-O-R" "Install nwg-look first"
                exit 1
            fi
            nwg-look ;;
		"QT Apps Settings (qt6ct)") 
            if ! command -v qt6ct &>/dev/null; then
                notify-send -i "$iDIR/error.png" "E-R-R-O-R" "Install qt6ct first"
                exit 1
            fi
            qt6ct ;;
		"QT Apps Settings (qt5ct)") 
            if ! command -v qt5ct &>/dev/null; then
                notify-send -i "$iDIR/error.png" "E-R-R-O-R" "Install qt5ct first"
                exit 1
            fi
            qt5ct ;;
        # "Choose Hyprland Animations") $scriptsDir/Animations.sh ;;
        # "Choose Monitor Profiles") $scriptsDir/MonitorProfiles.sh ;;
        # "Choose Rofi Themes") $scriptsDir/RofiThemeSelector.sh ;;
        # "Search for Keybinds") $scriptsDir/KeyBinds.sh ;;
        # "Toggle Game Mode") $scriptsDir/GameMode.sh ;;
        # "Switch Dark-Light Theme") $scriptsDir/DarkLight.sh ;;
        *) return ;;  # Do nothing for invalid choices
    esac

    # Open the selected file in the terminal with the text editor
    # if [ -n "$file" ]; then
        # $term -e bash -lc "cd '$directory' && $edit '$file'"
    # fi
    if [ -n "$file" ]; then
        if [ -n "$directory" ] && [ -d "$directory" ]; then
            kitty -e bash -lc "cd '$directory' && nvim '$file'"
        else
            kitty -e bash -lc "nvim '$file'"
        fi
    else 
      if [ -n "$directory" ]; then
          $term "$directory"
      fi
    fi


}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

main
