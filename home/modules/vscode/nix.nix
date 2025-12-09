{ pkgs, lib, ... }:

{
  extensions = with pkgs.vscode-extensions; [
    github.copilot
    github.copilot-chat
    github.vscode-github-actions
    ];
  userSettings = {
  "files.autoSave" = "afterDelay";
  "files.autoSaveDelay" = 10;

  "editor.formatOnSave" = true;
  "editor.formatOnPaste" = true;
  "editor.mouseWheelZoom" = true;

  "terminal.integrated.mouseWheelZoom" = true;

  "editor.fontFamily" =
    "'JetBrains Mono', 'Droid Sans Mono', 'monospace', monospace";

  "editor.snippetSuggestions" = "top";

  "editor.quickSuggestions" = {
    other = true;
    comments = true;
    strings = true;
  };

  "editor.fontSize" = 16;
  "editor.minimap.enabled" = false;
  "breadcrumbs.enabled" = false;

  "editor.cursorSmoothCaretAnimation" = "on";
  "editor.cursorBlinking" = "expand";
  "editor.wordWrap" = "on";

  "symbols.hidesExplorerArrows" = false;
  "workbench.iconTheme" = "material-icon-theme";

  "terminal.integrated.fontLigatures.enabled" = true;

  "editor.smoothScrolling" = true;

  "workbench.editor.showTabs" = "none";
  "workbench.statusBar.visible" = false;

  "editor.suggestFontSize" = 16;
  "editor.suggestLineHeight" = 30;

  "terminal.integrated.fontSize" = 16;

  "editor.hover.delay" = 1500;
  "editor.hover.enabled" = true;

  "workbench.tips.enabled" = false;

  "git.decorations.enabled" = false;

  "workbench.startupEditor" = "none";

  "editor.lightbulb.enabled" = "off";
  "editor.overviewRulerBorder" = false;

  "problems.decorations.enabled" = false;

  "editor.renderControlCharacters" = false;

  "editor.hideCursorInOverviewRuler" = true;

  "workbench.sideBar.location" = "right";

  "editor.multiCursorModifier" = "ctrlCmd";

  "diffEditor.renderSideBySide" = false;

  "workbench.editor.enablePreview" = false;

  "editor.lineNumbers" = "on";

  "chat.commandCenter.enabled" = false;
  "workbench.layoutControl.enabled" = false;
  "workbench.editor.editorActionsLocation" = "hidden";
  "workbench.navigationControl.enabled" = false;

  "window.commandCenter" = false;
  "workbench.activityBar.location" = "hidden";

  "explorer.confirmDelete" = false;

  "git.enableSmartCommit" = true;
  "git.confirmSync" = false;
  "git.autofetch" = true;

  "editor.stickyScroll.enabled" = false;

  "explorer.confirmDragAndDrop" = false;
  "explorer.confirmPasteNative" = false;

  "github.copilot.nextEditSuggestions.enabled" = true;

  # "workbench.colorTheme" = "Tokyo Night Storm";  
  };
  keybindings = [
  {
    key = "ctrl+d";
    command = "editor.action.copyLinesDownAction";
    when = "editorTextFocus";
  }

  {
    key = "ctrl+enter";
    command = "workbench.action.terminal.toggleTerminal";
  }

  {
    key = "ctrl+h";
    command = "workbench.action.toggleSidebarVisibility";
  }

  {
    key = "ctrl+1";
    command = "workbench.view.explorer";
  }

  {
    key = "ctrl+2";
    command = "workbench.view.scm";
  }

  {
    key = "ctrl+3";
    command = "workbench.view.extensions";
  }

  {
    key = "ctrl+4";
    command = "workbench.action.findInFiles";
  }

  {
    key = "ctrl+n";
    command = "explorer.newFile";
  }

  {
    key = "ctrl+;";
    command = "workbench.action.toggleAuxiliaryBar";
  }  
];

}

