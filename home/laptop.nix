{
pkgs,
lib,
...
}: {
imports = [./modules/git];
home.username = "virajs-laptop";
home.homeDirectory = lib.mkForce "/home/virajs-laptop";
home.stateVersion = "25.11";
programs.home-manager.enable=true;
}
