{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    wl-clipboard
  ];

  services.cliphist = {
    enable = true;
    package = pkgs.cliphist;
    clipboardPackage = pkgs.wl-clipboard;
    extraOptions = [
      ""
    ];
    allowImages = true;
  };
}
