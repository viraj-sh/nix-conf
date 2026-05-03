{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  services.lxqt-policykit-agent = {
    enable = true;
    package = pkgs.lxqt.lxqt-policykit;
  };
}
