{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    git
    git-credential-manager
    lazygit
    gh
  ];

  programs = {
    gh.gitCredentialHelper.enable = true;
    git = {
      enable = true;
      settings = {
        user.name = "viraj-sh";
        user.email = "virajs45@proton.me";
        init.defaultBranch = "main";
        pull.rebase = false;
        credential.helper = "manager";
      };
    };
    # gitui.enable = true; # terminal UI
    git-cliff.enable = true; # changelog generator
    # git-credential-oauth.enable = true; # OAuth for private repos
    # git-credential-oauth.extraFlags = [
    #   "-device"
    # ];
  };
}
