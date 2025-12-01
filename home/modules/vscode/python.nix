{
  pkgs,
  shared,
}: {
  userSettings =
    shared.sharedSettings
    // {
      "[json]"."editor.defaultFormatter" = "vscode.json-language-features";
      "[html]"."editor.defaultFormatter" = "vscode.html-language-features";
      "[jsonc]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[javascript]"."editor.defaultFormatter" = "vscode.typescript-language-features";
      python.defaultInterpreterPath = "/etc/profiles/per-user/virajs/bin/python";
      workbench.colorTheme = "PyCharm Dark Theme for Python";
      terminal.integrated.fontSize = 13;
      gitlens.ai.model = "vscode";
      gitlens.ai.vscode.model = "copilot:gpt-4.1";
      extensions.ignoreRecommendations = true;
      "chat.mcp.gallery.enabled " = true;
      git.ignoreRebaseWarning = true;
      git.replaceTagsWhenPull = true;
    };

  keybindings = shared.sharedKeybindings;

  extensions = with pkgs.vscode-extensions; [
    ms-python.python
    ms-toolsai.jupyter
  ];
}
