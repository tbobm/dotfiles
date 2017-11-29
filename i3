set $mod Mod1
set $sup Mod4
set $return mode "defaults"

font pango:monospace 8

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal
bindsym $mod+Shift+q kill
bindsym $mod+d exec --no-startup-id i3-dmenu-desktop --dmenu='rofi -dmenu -i'

bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal/vertical orientation
bindsym $mod+h split h
bindsym $mod+v split v

bindsym $mod+f fullscreen toggle

bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

bindsym $mod+a focus parent

bindsym $mod+1 workspace number 1:main
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

## Modes
set $mode_launcher Launch [c]alendar [f]irefox [g]oogle [m]attermost [M]ails [r]un [t]rello [h]elp (i3)
bindsym $mod+o mode "$mode_launcher"

mode "$mode_launcher" {
	bindsym f exec firefox
	bindsym m exec firefox https://mattermost.numberly.com/
	bindsym t exec firefox https://trello.com/
	bindsym c exec firefox https://calendar.google.com/
	bindsym g exec firefox "https://google.com/search?q=$(i3-input -P 'Search: ' -F 'Google' | grep -oP '(?<=output = ).*' | sed 's/^.*= //')"
	bindsym H exec firefox https://i3wm.org/docs/refcard.html
	bindsym Shift+m exec firefox https://mail.google.com/mail
	bindsym r exec dmenu_run
	bindsym Shift+l exec /usr/local/bin/smapping

	bindsym Escape mode "default"
	bindsym Return mode "default"
}

set $mode_media [H]igher [L]ower [M]ute [U]nmute - [K]eyboard
bindsym $mod+m mode "$mode_media"

mode "$mode_media" {
	bindsym h exec pactl set-sink-volume 0 +5%
	bindsym l exec pactl set-sink-volume 0 -5%
	bindsym u exec pactl set-sink-mute 0 0
	bindsym m exec pactl set-sink-mute 0 1
	bindsym k exec smapping

	bindsym Escape mode "default"
	bindsym Return mode "default"
}

bindsym $sup+l exec "lock.sh"
bindsym $sup+Right move workspace to output right
bindsym $sup+Left move workspace to output left
bindsym Print exec --no-startup-id exec "scrot '%Y-%m-%d_%H%M%S.png' -e 'mv $f /usr/local/share/images/'"

exec --no-startup-id "i3-msg 'workspace 1; append_layout ~/.config/i3/workspace1.json; exec start_IM; exec terminator;'"
exec --no-startup-id "i3-msg 'workspace 2; append_layout ~/.config/i3/workspace2.json; exec terminator;'"
exec --no-startup-id "i3-msg 'workspace 3; append_layout ~/.config/i3/workspace3.json; exec terminator;'"
exec --no-startup-id "pkill xconsole"
exec --no-startup-id "nitrogen --restore"

bar {
	position top
	status_command py3status
}
