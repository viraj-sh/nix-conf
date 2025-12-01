{
  pkgs,
  shared,
}: {
  userSettings =
    shared.sharedSettings
    // {
      files.autoSave = "afterDelay";
      files.autoSaveDelay = 10;
      editor.formatOnSave = true;
      editor.minimap.enabled = false;
      editor.lineNumbers = "off";
      workbench.colorTheme = "Tokyo Night Storm";
      terminal.integrated.fontSize = 16;
    };

  keybindings = shared.sharedKeybindings;

  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    jnoortheen.nix-ide
    ms-vsliveshare.vsliveshare
  ];
}
