{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  services.hyprpolkitagent = {
    enable = true;
    package = pkgs.hyprpolkitagent;
  };
}
