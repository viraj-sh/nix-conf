{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xclip
  ];
  services.greenclip = {
    enable = true;
    package = pkgs.haskellPackages.greenclip;
  };
}
