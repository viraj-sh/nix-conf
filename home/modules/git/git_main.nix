{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  programs = {
    git = {
      enable = true;
      userName = "viraj-sh";
      userEmail = "virajs45@proton.me";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
        credential.helper = "manager";
      };
    };
    gitui.enable = true; # terminal UI
    git-cliff.enable = true; # changelog generator
    # git-credential-oauth.enable = true; # OAuth for private repos
  };
}
