{
  config,
  pkgs,
  ...
}: {
  services.greenslip = {
    enable = true;
    package = pkgs.haskellPackages.greensclip;
  };
}
