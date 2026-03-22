{
  pkgs,
  config,
  ...
}:

{
  target = "${config.hm.xdg.userDirs.publicShare}/${baseNameOf ./.}";

  settings = {
    app = {
      attachmentFolderPath = "./_attachments";
      defaultViewMode = "preview";
      livePreview = false;
      readableLineLength = true;
      showInlineTitle = false;
      showLineNumber = true;
      tabSize = 2;
      trashOption = "local";
      vimMode = false;
    };

    appearance = {
      cssTheme = "Minimal";
      accentColor = config.lib.stylix.colors.withHashtag.base04;
      showRibbon = false;
      nativeMenus = false;
    };

    themes = [ { pkg = pkgs.obsidian-plugins.minimal; } ];

    corePlugins = [
      {
        name = "canvas";
        settings = {
          newFileLocation = "folder";
          newFileFolderPath = "_canvas";
          defaultWheelBehavior = "zoom";
          snapToObjects = true;
          snapToGrid = true;
          cardLabelVisibility = "hover";
        };
      }

      {
        name = "daily-notes";
        settings = {
          format = "DD-MM-YYYY";
          folder = "_daily";
          template = "_daily/_template";
        };
      }

      "audio-recorder"
      "backlink"
      "bases"
      "bookmarks"
      "command-palette"
      "editor-status"
      "file-explorer"
      "global-search"
      "graph"
      "markdown-importer"
      "outgoing-link"
      "outline"
      "page-preview"
      "properties"
      "random-note"
      "slash-command"
      "slides"
      "switcher"
      "tag-pane"
      "word-count"
    ];

    communityPlugins = import ./community-plugins.nix {
      inherit pkgs config;
    };

    hotkeys = import ./binds.nix;

    cssSnippets = [
      {
        name = "system-font";
        text = # css
          ''
            body {
              --font-default: "${config.stylix.fonts.sansSerif.name}";
              --zoom-factor: 1.2;
            }

            body.minimal-theme {
              --font-editor-override: "${config.stylix.fonts.monospace.name}";
            }
          '';
      }

      {
        name = "stop-blinking-cursor";
        text = # css
          ''
            .cm-cursorLayer { animation: none !important; }
          '';
      }

      {
        name = "helix-remove-statusbar";
        text = # css
          ''
            .cm-hx-command-panel { display: none !important; }
            .cm-hx-status-panel  { display: none !important; }
          '';
      }

      {
        name = "floating-statusbar";
        text = # css
          ''
            body {
              --status-bar-position: absolute;
              --status-bar-radius: var(--radius-m);
            }

            body .status-bar {
              transform: translateX(calc(100% + 5px));
              transition: transform 300ms 150ms;
              bottom: 5px;
              right: 5px;
            }

            body .status-bar::before {
              width: 100%;
              min-height: 100%;
              content: " ";
              position: absolute;
              left: 0;
              bottom: 0;
              transform: translateX(-100%);
            }

            body .status-bar:hover {
              transform: none;
              transition: transform 300ms 150ms;
            }
          '';
      }

      {
        name = "docxer-hide";
        text = # css
          ''
            #docxer-header { display: none !important;  }
          '';
      }
    ];
  };
}
