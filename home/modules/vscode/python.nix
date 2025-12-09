{ pkgs, lib, ... }:

{
  extensions = with pkgs.vscode-extensions; [
    ms-python.python
    ms-python.black-formatter
    esbenp.prettier-vscode
    ms-python.debugpy

  ];
  userSettings = {
    "editor.tabSize" = 2;
    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay"= 10;
    "editor.formatOnPaste"= true;
    "editor.mouseWheelZoom" = true;
    "terminal.integrated.mouseWheelZoom" = true;
    "editor.fontFamily" = "'JetBrains Mono', 'Droid Sans Mono', 'monospace', monospace";
    "editor.snippetSuggestions" = "top";

    "editor.quickSuggestions" = {
      other = true;
      comments = true;
      strings = true;
    };

    "editor.fontSize" = 16;
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
    "editor.multiCursorModifier" = "ctrlCmd";
    "diffEditor.renderSideBySide" = false;
    "workbench.editor.enablePreview" = false;
    "chat.commandCenter.enabled" = false;
    "workbench.layoutControl.enabled" = false;
    "workbench.editor.editorActionsLocation" = "hidden";
    "workbench.activityBar.location" = "hidden";
    "explorer.confirmDelete" = false;
    "git.enableSmartCommit" = true;
    "git.confirmSync" = false;
    "git.autofetch" = true;
    "editor.stickyScroll.enabled" = false;
    "explorer.confirmDragAndDrop" = false;

    "[json]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };

    "[html]" = {
      "editor.defaultFormatter" = "vscode.html-language-features";
    };

    "explorer.confirmPasteNative" = false;

    "[jsonc]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };

    "workbench.sideBar.location" = "right";
    "gitlens.ai.model" = "vscode";
    "gitlens.ai.vscode.model" = "copilot:gpt-4.1";
    "python.defaultInterpreterPath" = "/etc/profiles/per-user/virajs/bin/python";

    "github.copilot.enable" = {
      "*" = false;
      markdown = false;
    };

    "workbench.colorTheme" = "PyCharm Dark Theme for Python";

    "[javascript]" = {
      "editor.defaultFormatter" = "vscode.typescript-language-features";
    };

    "extensions.ignoreRecommendations" = true;
    "github.copilot.nextEditSuggestions.enabled" = true;
    "terminal.integrated.fontSize" = 13;
    "chat.mcp.gallery.enabled " = true;
    "git.ignoreRebaseWarning" = true;
    "git.replaceTagsWhenPull" = true;
  };
  keybindings = [
  {
    key = "ctrl+d";
    command = "editor.action.copyLinesDownAction";
  }

  {
    key = "ctrl+enter";
    command = "workbench.action.terminal.newInNewWindow";
    when = "terminalHasBeenCreated || terminalProcessSupported";
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

