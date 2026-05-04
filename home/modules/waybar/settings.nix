{host, ...}: let
  custom = {
    font = "JetBrainsMono Nerd Font Mono";
    font_size = "14px";
    font_weight = "bold";
    opacity = "1";
    indicator_height = "2px";
  };
in {
  programs.waybar.settings.mainBar = with custom; {
    output = "eDP-1";
    position = "top";
    layer = "top";
    height = 28;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "niri/workspaces"
    ];
    modules-center = ["clock"];
    modules-right = [
      "tray"
      "custom/record"
      "backlight"
      "cpu"
      "memory"
      "bluetooth"
      "custom/mic"
      "pulseaudio"
      "network"
      "custom/notification"
      "custom/power"
    ];
    bluetooth = {
      format = " {status}";
      format-connected = "<span color='#A7C080'> connected</span>";
      format-connected-battery = "<span color='#A7C080'> connected</span>";
      tooltip-format = "{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_battery_percentage}%";
      on-click = "bluetoothctl show | grep -q 'Powered: yes' && bluetoothctl power off || bluetoothctl power on";

      on-click-right = "kitty --override font_size=14 --title float_kitty bluetuith";
    };
    "custom/record" = {
      interval = 2;
      exec = "echo ' '";
      on-click = "bash /home/virajs-desktop/nixos-config/home/modules/hyprland/scripts/record.sh";
      on-click-right = "pkill wf-recorder && notify-send '🛑 Recording Stopped' 'Screen recording has been stopped.'";
      tooltip = true;
    };
    backlight = {
      format = " {percent}%";
    };
    clock = {
      calendar = {
        format = {
          today = "<span color='#98971A'><b>{}</b></span>";
        };
      };
      format = "{:%I:%M %p - %a, %d %b %Y}";
      tooltip = "true";
      tooltip-format = "<tt><big>{calendar}</big></tt>";
      format-alt = "  {:%d/%m}";
    };
    "hyprland/workspaces" = {
      format = "{icon}";

      format-icons = {
        "1" = "";
        "2" = "";
        "3" = "";
        "4" = "";
        "5" = "";
        "6" = "";
        "7" = "";
        "8" = "";
        "9" = "";
        "10" = "";
        "active" = "";
        "default" = "";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [];
        "2" = [];
        "3" = [];
        "4" = [];
        "5" = [];
      };
    };
    cpu = {
      format = "<span></span> {usage}%";
      format-alt = "<span></span> {avg_frequency} GHz";
      interval = 2;
      on-click-right = "kitty --override font_size=14 --title float_kitty btop";
      states = {
        critical = 70;
        warning = 25;
      };
    };
    memory = {
      format = "<span>󰟜 </span>{}%";
      format-alt = "<span>󰟜 </span>{used} GiB"; # 
      interval = 2;
      on-click-right = "kitty --override font_size=14 --title float_kitty btop";
      states = {
        critical = 70;
        warning = 25;
      };
    };
    network = {
      format-wifi = "<span></span> {signalStrength}%";
      format-ethernet = "<span>󰀂</span>";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "<span>󰖪</span>";
    };
    tray = {
      icon-size = 20;
      spacing = 8;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = " {volume}%";

      format-icons = {
        default = [""];
      };

      scroll-step = 5;
      on-click = "pamixer -t";
      on-click-right = "pavucontrol";
    };

    "custom/mic" = {
      interval = 1;

      exec = ''
        bash -c '
          if [ "$(pamixer --default-source --get-mute)" = "true" ]; then
            echo "󰍭 $(pamixer --default-source --get-volume)%"
          else
            echo " $(pamixer --default-source --get-volume)%"
          fi
        '
      '';

      on-click = "pamixer --default-source -t";
      on-click-right = "pavucontrol -t 4";

      on-scroll-up = "pamixer --default-source -i 5";
      on-scroll-down = "pamixer --default-source -d 5";
    };

    "custom/notification" = {
      tooltip = false;
      format = "{icon}";
      format-icons = {
        notification = "<span><sup></sup></span>";
        none = "";
        dnd-notification = "<span><sup></sup></span>";
        dnd-none = "";
        inhibited-notification = "<span><sup></sup></span>";
        inhibited-none = "";
        dnd-inhibited-notification = "<span><sup></sup></span>";
        dnd-inhibited-none = "";
      };
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };

    "custom/power" = {
      tooltip = false;
      format = "";
      tooltip-format = "Power Menu";
      on-click = "wlogout";
      escape = true;
    };
  };
}
