{pkgs, ...}: {
  home.packages = with pkgs; [opencode-desktop];
  programs.claude-code = {
    enable = true;
    enableMcpIntegration = true;
  };
}
