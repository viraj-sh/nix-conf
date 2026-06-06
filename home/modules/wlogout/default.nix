{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    wlogout
  ];

  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "logout";
        "action" = "niri msg action quit";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "lock";
        "action" = "swaylock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];
    style = ''
      @define-color foreground #2D353B;
      @define-color primary #A7C080;
      @define-color on_primary #2D353B;

      * {
          font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        background-image: none;

        box-shadow: none;
      }

      window {
        background: url("");
        background-size: cover;
        font-size: 16pt;
      }

      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;

        border-radius: 80px; /* Increased border radius for a more rounded look */
        border:0px;

        color: @foreground;
        background-color: alpha(@primary, 0.2);
        margin: 10px;
          min-width: 150px;
          min-height: 150px;
      }

      button:focus {
        background-color: alpha(@primary, 0.5);

      }

      button:hover {
          background-color: alpha(@primary, 0.9);;
        opacity: 0.8;
          color: @on_primary;

      }

      /* Adjust the size of the icon or content inside the button */
      button span {
          font-size: 1.2em; /* Increase the font size */
      }

      /*
      -----------------------------------------------------
      Buttons
      -----------------------------------------------------
      */

      #lock {
        margin: 10px;
        border-radius: 20px;
          border:1px solid @primary;
        background-image: image(url("/home/virajs-desktop/Nextcloud/Pictures/icons/lock.png"));
      }

      #logout {
        margin: 10px;
        border-radius: 20px;
          border:1px solid @primary;
        background-image: image(url("/home/virajs-desktop/Nextcloud/Pictures/icons/logout.png"));
      }

      #suspend {
        margin: 10px;
        border-radius: 20px;
          border:1px solid @primary;
        background-image: image(url("/home/virajs-desktop/Nextcloud/Pictures/icons/suspend.png"));
      }

      #hibernate {
        margin: 10px;
        border-radius: 20px;
          border:1px solid @primary;
        background-image: image(url("/home/virajs-desktop/Nextcloud/Pictures/icons/hibernate.png"));
      }

      #shutdown {
        margin: 10px;
        border-radius: 20px;
          border:1px solid @primary;
        background-image: image(url("/home/virajs-desktop/Nextcloud/Pictures/icons/shutdown.png"));
      }

      #reboot {
        margin: 10px;
        border-radius: 20px;
          border:1px solid @primary;
        background-image: image(url("/home/virajs-desktop/Nextcloud/Pictures/icons/reboot.png"));
      }
    '';
  };
}
