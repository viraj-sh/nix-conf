{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    hyprpaper
  ];

  services.hyprpaper = {
    package = pkgs.hyprpaper;
    enable = true;
    settings = {
      preload = [
        "/home/virajs/Nextcloud/Pictures/Wallpapers/Desktop/everforest_wp.jpg"
        "/home/virajs/Nextcloud/Pictures/Wallpapers/Desktop/piano_wp.jpg"
      ];
      wallpaper = [
        "eDP-1,/home/virajs/Nextcloud/Pictures/Wallpapers/Desktop/everforest_wp.jpg"
        "HDMI-A-1,/home/virajs/Nextcloud/Pictures/Wallpapers/Desktop/piano_wp.jpg"
      ];
    };
  };
}
