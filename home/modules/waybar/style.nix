{ ... }:
let
  custom = {
    font = "JetBrainsMono Nerd Font Mono";
    font_size = "14px";
    font_weight = "bold";
    opacity = "1";
  };
in
{
  programs.waybar.style = with custom; ''
    * {
      border: none;
      border-radius: 0px;
      padding: 0;
      margin: 0;
      font-family: ${font};
      font-weight: ${font_weight};
      opacity: ${opacity};
      font-size: ${font_size};
    }

    window#waybar {
      border-top: 1px solid;
    }

    tooltip {
      border: 1px solid;
    }

    tooltip label {
      margin: 5px;
    }


    #workspaces button {
      background: transparent;
      margin-right: 5px;
    }




    #workspaces {
      margin: 0 4px;
      padding: 0;
    }



    #bluetooth,
    #cpu,
    #backlight {
      margin-right: 5px;
    }
    #network {
      margin-right: 8px;
    }
    #custom-notification  {
      margin-right: 10px;
    }
    #custom-power,
    #tray {
      margin-right: 15px;
    }
    #memory,
    #pulseaudio {
      margin-right: 10px;
    }
    #tray > .widget {
      margin-right: 5px;
    }
    #tray > .widget:last-child {
      margin-right: 10px;
    }

    #custom-power {
      color: #e67e80;
    }

    #cpu .cpu-val {
      color: #A7C080;
    }
    #cpu.warning .cpu-val {
      color: #E69875;
    }
    #cpu.critical .cpu-val {
      color: #e67e80;
    }


    #memory .mem-val {
      color: #A7C080;
    }
    #memory.warning .mem-val {
      color: #E69875;
    }
    #memory.critical .mem-val {
      color: #e67e80;
    }


    #pulseaudio .sound-val {
      color: #A7C080;
    }
    #pulseaudio.warning .sound-val {
      color: #E69875;
    }
    #pulseaudio.critical .sound-val {
      color: #e67e80;
    }

    #network {
      color: #A7C080;
    }
    #network.disconnected {
      color: #e67e80;
    }
    #network.ethernet,
    #network.wifi {
      color: #A7C080;
    }

    #bluetooth.connected {
      color: #A7C080;
    }
    #bluetooth.on {
      color: #e67e80;
    }
    #bluetooth.off {
      color: #45443C;
    }
    #workspaces button.active {
      color: #A7C080;
    }



  '';
}
