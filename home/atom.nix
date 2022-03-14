{pkgs, ...}: {
  home.file.".atom/keymap.cson".source = pkgs.writeTextFile {
    name = "atom-keymap";
    text = ''
    'atom-workspace':
       "alt-f7": "find-and-replace:select-all"
       "ctrl-f7": "find-and-replace:find-next-selected"
       "ctrl-shift-f7": "find-and-replace:find-previous-selected"
       "shift-f7": "find-and-replace:find-previous"
       "f7": "find-and-replace:find-next"
       "ctrl-g": "find-and-replace:find-next"
       "ctrl-shift-G": "find-and-replace:find-previous"
    '';
  };
  home.file.".atom/config.cson".source = pkgs.writeTextFile {
    name = "atom-keymap";
    text = ''
    "*":
      core:
        autoHideMenuBar: true
        closeDeletedFileTabs: true
        disabledPackages: [
          "indent-guide-improved"
          "git-control"
          "git-log"
          "git-plus"
          "git-status"
          "spell-check"
          "linter-coffeelint"
        ]
        excludeVcsIgnoredPaths: false
        ignoreNames: [
          ".hg"
          ".svn"
          ".DS_Store"
          "._*"
          "Thumbs.db"
          ".git"
          "node_modules"
        ]
        telemetryConsent: "no"
      editor:
        fontSize: 18
        scrollPastEnd: true
      "git-plus":
        remoteInteractions:
          pullRebase: true
      "language-log":
        "tail": true
      "linter-ui-default":
        panelHeight: 300
      minimap:
        plugins:
          "find-and-replace": true
          "find-and-replaceDecorationsZIndex": 0
          "highlight-selected": true
          "highlight-selectedDecorationsZIndex": 0
          selection: true
          selectionDecorationsZIndex: 0
      "spell-check": {}
      "todo-show":
        ignoreThesePaths: [
          "node_modules"
          "vendor"
          "bower_components"
          "*.pdf"
          "public"
          ".cache"
        ]
      "tree-view":
        hideVcsIgnoredFiles: false
      welcome:
        showOnStartup: false
      whitespace:
        removeTrailingWhitespace: false
    ".basic.html.text":
      editor:
        preferredLIneLength: 81
      "multi-wrap-guid":
        column: [
          81
        ]
    ".coffee.md":
      editor:
        autoIndent: true
        autoIndentOnPaste: false
      whitespace:
        removeTrailingWhitespace: false
    ".coffee.source":
      editor:
        autoIndent: true
        autoIndentOnPaste: false
    ".jade.source":
      editor:
        autoIndent: true
        autoIndentOnPaste: false
    ".md":
      whitespace:
        removeTrailingWhitespace: false
    '';
  };
}
