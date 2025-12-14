{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [

  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          # name = "gruvbox";
          style = "dark";
        };
        languages = {
          nix.enable = true;
          java.enable = true;
          python.enable = true;
          clang.enable = true;
          html.enable = true;
          css.enable = true;
          enableLSP = true;
          enableTreesitter = true;
          };
        assistant.copilot.cmp.enable = true;
        assistant.copilot.enable = true;
  
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
      };
      

    };
  };
}
