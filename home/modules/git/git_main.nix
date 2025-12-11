{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    git
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        userName = "viraj-sh";
        userEmail = "virajs45@proton.me";
        init.defaultBranch = "main";
        pull.rebase = false;
        credential.helper = "manager";
      };
    };
    # gitui.enable = true; # terminal UI
    git-cliff.enable = true; # changelog generator
    # git-credential-oauth.enable = true; # OAuth for private repos
  };
}
