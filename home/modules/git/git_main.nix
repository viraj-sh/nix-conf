{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    git
    git-credential-oauth
    lazygit
    gh
  ];

  programs = {
    gh.gitCredentialHelper.enable = true;
    git = {
      enable = true;
      userName = "viraj-sh";
      userEmail = "virajs45@proton.me";
      settings = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
    # gitui.enable = true; # terminal UI
    git-cliff.enable = true; # changelog generator
    git-credential-oauth.enable = true; # OAuth for private repos
    git-credential-oauth.extraFlags = [
      "-device"
    ];
  };
}
