{ pkgs, lib, ... }:

{
  extensions = with pkgs.vscode-extensions; [
    "ms-python.python"

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
    }
  ];
}

