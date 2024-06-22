###
 # @FilePath: /sketchybar/items/right/battery.sh
 # @author: Wibus
 # @Date: 2022-08-01 21:18:16
 # @LastEditors: Wibus
 # @LastEditTime: 2022-08-02 18:01:45
 # Coding With IU
### 

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# if percentage is not empty
if [ -n "$PERCENTAGE" ]
then


sketchybar --add item battery right \
           --set battery update_freq=3 \
                         icon.drawing=off \
                         script="$PLUGIN_DIR/power.sh" \
                         background.color=0xff383838\
                         background.padding_left=0

sketchybar --add item power_logo right \
           --set power_logo icon= \
                 icon.color=0xff121219 \
                 label.drawing=off \
                 background.color=0xff7daea3 \
                 update_freq=90

fi
