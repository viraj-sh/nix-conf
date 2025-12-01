{
  config,
  pkgs,
  ...
}: let
  shared = import ./shared.nix;
  nixProfile = import ./nix.nix {inherit pkgs shared;};
  pythonProfile = import ./python.nix {inherit pkgs shared;};
in {
  programs.vscode = {
    enable = true;

    profiles = {
      nix = nixProfile;
      python = pythonProfile;
    };
  };
}
