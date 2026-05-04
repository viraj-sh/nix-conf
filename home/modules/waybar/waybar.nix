{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    btop
  ];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
