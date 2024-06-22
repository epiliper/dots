###
 # @FilePath: /sketchybar/items/left/spaces.sh
 # @author: Wibus
 # @Date: 2022-08-01 21:17:08
 # @LastEditors: Wibus
 # @LastEditTime: 2022-08-01 21:17:18
 # Coding With IU
### 

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
SPACES=()

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  SPACES+=(space.$sid)
  sketchybar --add space space.$sid left \
             --set space.$sid associated_space=$sid \
                              icon=${SPACE_ICONS[i]} \
                              icon.padding_left=20 \
                              icon.padding_right=20 \
                              icon.highlight_color=0xff7daea3 \
                              background.padding_left=4 \
                              background.padding_right=-12  \
                              background.color=0xff383838 \
                              background.drawing=on \
                              label.drawing=off \
                              click_script="yabai -m space --focus $sid"
done

sketchybar --add item space_separator left \
           --set space_separator icon= \
                                 background.padding_left=23 \
                                 background.padding_right=23 \
                                 label.drawing=off \
                                 icon.color=0xff7eaea3 \

sketchybar --add item window_title left \
           --set window_title    script="~/.config/sketchybar/plugins/window_title.sh" \
                                 icon.drawing=off \
                                 label.color=0xffd4be98\
           --subscribe window_title front_app_switched
