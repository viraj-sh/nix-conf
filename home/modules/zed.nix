{
  config,
  pkgs,
  ...
}: {
  imports = [
  ];
  home.packages = with pkgs; [
    nil
    nixd
  ];

  programs.zed-editor = {
    enable=true;
    extensions = ["nix" "vscode_dark_modern.zed" "material-icon-theme"];
    enableMcpIntegration = true;
    mutableUserSettings = false;
    mutableUserDebug = false;
    mutableUserKeymaps = false;
    mutableUserTasks = false;
    userSettings = {
      # Others
        git = {
          blame=null;
        };
        format_on_same = true;
        soft_wrap = "editor_width";
        current_line_highlight = "line";
        selection_highlight = true;

      # Cursor
      cursor_shape = "bar";
      cursor_blink = false;

      # Font
        ui_font_size = 14;
        buffer_font_size = 14;
        agent_ui_font_size = 14;
        agent_buffer_font_size = 14;
        git_commit_buffer_font_size = 14;
        ui_font_family = "JetBrainsMono Nerd Font Mono";
        buffer_font_family = "JetBrainsMono Nerd Font Mono";
        agent_buffer_font_family = "JetBrainsMono Nerd Font Mono";
        agent_ui_font_family = "Inter";
        terminal = {
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font Mono";
        };

      # Theme
      theme = {
        mode = "dark";
        light = "macOS Classic Light";
        dark = "macOS Classic Dark";
      };
      icon_theme = "Material Icon Theme";
    };

  };

  }
