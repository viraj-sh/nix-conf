{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [];
  fonts = {
    packages = with pkgs; [
      noto-fonts
      public-sans
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
      font-awesome_5
      font-awesome
      noto-fonts-color-emoji
    ];
  };
}
