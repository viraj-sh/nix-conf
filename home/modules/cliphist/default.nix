{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  services.cliphist = {
    enable = true;
    package = pkgs.cliphist;
    extraOptions = [
      ""
    ];
    allowImages = true;
  };
}
