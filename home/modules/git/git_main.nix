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
        credential.credentialStore = "cache";
      };
    };
    git-cliff.enable = true; # changelog generator
  };
}
