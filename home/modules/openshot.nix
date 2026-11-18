{pkgs, ...}: {
  home.packages = with pkgs; [
    losslesscut
    kdePackages.kdenlive
    audacity
  ];
}
