{pkgs, ...}: {
  imports = [];
  security = {
    polkit = {
      enable = true;
      package = pkgs.polkit;
      debug = true;
    };
  };
}
