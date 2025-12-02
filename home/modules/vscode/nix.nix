{ pkgs, lib, ... }:

{
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    kamadorueda.alejandra
    michelemelluso.gitignore
  ];
  userSettings = {
    "editor.tabSize" = 2;
    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay"= 10;
    "editor.formatOnPaste"= true;
  };
  keybindings = [
    {
      key = "ctrl+d";
      command = "editor.action.copyLinesDownAction";
      when = "terminalFocus";
    }
  ];
}

