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
    enable = true;
    extensions = ["nix" "material-icon-theme"];
    enableMcpIntegration = true;
    mutableUserSettings = false;
    mutableUserDebug = false;
    mutableUserKeymaps = false;
    mutableUserTasks = false;
    userKeymaps = [
      {
        bindings = {
          ctrl-n = null;
          ctrl-shift-n = null;
          ctrl-1 = "project_panel::ToggleFocus";
          ctrl-2 = "git_panel::ToggleFocus";
          ctrl-3 = "outline_panel::ToggleFocus";
          ctrl-4 = "zed::Extensions";
          ctrl-d = "editor::DuplicateLineDown";
        };
      }
      {
        context = "ProjectPanel";
        bindings = {
          ctrl-n = "project_panel::NewFile";
          ctrl-shift-n = "project_panel::NewDirectory";
        };
      }
    ];
    userSettings = {
      # Others
      git = {
        blame = null;
      };
      format_on_same = true;
      soft_wrap = "editor_width";
      current_line_highlight = "line";
      selection_highlight = true;
      multi_cursor_modifier= "cmd_or_ctrl";
      show_whitespaces = "selection";
      indent_guides = {
        enabled = true;
        line_width = 1;
      };
      tab_size = 4;
      hard_tabs = false;

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
        light = "Ayu Light";
        dark = "Ayu Dark";
      };
      icon_theme = "Material Icon Theme";

      # Panels
      title_bar = {
        show_branch_status_icon = false;
        show_project_items = false;
        show_onboarding_banner = false;
        show_user_picture = false;
        show_user_menu = false;
        show_sign_in = false;
        show_menus = false;
        button_layout = "platform_default";
      };
      gutter = {
        line_numbers = true;
        folds = true;
        min_line_number_digits = 0;
      };
      tab_bar = {
        show = true;
        show_nav_history_buttons = false;
        show_tab_bar_buttons = false;
      };
      toolbar = {
          quick_actions = false;
      };
      status_bar = {
          "experimental.show" = false;
      };
      project_panel = {
          button = false;
          default_width = 300;
          folder_indicator = "both";
          scrollbar = {
              show = "never";
              horizontal_scroll = true;
          };
          sticky_scroll = false;
          indent_guides = {
              show = "always";
          };
      };
    };
  };
}
