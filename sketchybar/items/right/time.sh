###
 # @FilePath: /sketchybar/items/time.sh
 # @author: Wibus
 # @Date: 2022-08-01 20:40:16
 # @LastEditors: Wibus
 # @LastEditTime: 2022-08-01 20:40:16
 # Coding With IU
### 
sketchybar --add item time right \
           --set time update_freq=1 \
                      icon.drawing=off \
                      script="~/.config/sketchybar/plugins/time.sh" \
                      background.color=0xff374148 \
		      label.font="$FONT:Regular:14.5" \
                      background.padding_left=0
			

sketchybar --add item time_logo right\
           --set time_logo icon= \
                           label.drawing=off \
                           icon.color=0xff2d353b \
                           label.drawing=off \
                           background.color=0xffdbbc7f
