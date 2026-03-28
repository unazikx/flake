{
  pkgs,
  lib,
  config,
  ...
}:

let
  mkPluginMime =
    run: list:
    (map (mime: {
      inherit mime run;
    }) list);

  mkPluginUrl =
    run: list:
    (map (url: {
      inherit url run;
    }) list);

  mkRuleMime =
    mimes: use:
    map (mime: {
      inherit mime use;
    }) mimes;

  mkRuleUrl =
    urls: use:
    map (url: {
      inherit url use;
    }) urls;
in

{
  shellWrapperName = "yy";

  settings = {
    mgr = {
      ratio = [
        1
        3
        4
      ];

      show_hidden = false;
      sort_by = "natural";
      sort_dir_first = true;
      sort_reverse = false;
      linemode = "size";
      show_symlink = true;
    };

    preview = {
      wrap = "yes";
      tab_size = 1;
      image_filter = "lanczos3";
      image_quality = 90;
      max_height = 5000;
      max_width = 5000;
    };

    input = lib.genAttrs [
      "cd_origin"
      "find_origin"
      "rename_origin"
      "filter_origin"
      "create_origin"
      "delete_origin"
      "search_origin"
      "shell_origin"
    ] (_n: "center");

    plugin = {
      prepend_previewers = lib.mkMerge [
        (mkPluginMime "office" [
          "application/ms-*"
          "application/msword"
          "application/oasis.*"
          "application/openxmlformats-officedocument.*"
        ])
        (mkPluginMime "ouch --archive-icon=''" [
          "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}"
        ])
        (mkPluginUrl ''faster-piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dracula -- "$1"'' [
          "*.md"
        ])
        (mkPluginUrl "comicthumb" [
          "*.cb[7rz]"
        ])
        (mkPluginMime "djvu-view" [
          "image/djvu"
        ])
      ];

      prepend_fetchers = [
        {
          id = "git";
          url = "*";
          run = "git";
        }
        {
          id = "git";
          url = "*/";
          run = "git";
        }
      ];
    };

    opener = {
      edit = [
        {
          run = "${config.hm.home.sessionVariables.EDITOR} %s";
          desc = "Open in editor";
          block = true;
        }
      ];

      play = [
        {
          run = "mpv --fs %s";
          desc = "Open video in MPV";
        }
      ];

      image = [
        {
          run = "swayimg %s";
          desc = "Open image in swayimg";
        }
      ];

      pdf = [
        {
          run = "zathura %s";
          desc = "Open pdf in Zathura";
        }
      ];

      msoffice = [
        {
          run = "libreoffice %s";
          desc = "Open document in Libreoffice";
          orphan = true;
        }
      ];

      msoffice-pdf = [
        {
          run = "zaread %s";
          desc = "Open document in Zathura";
          orphan = true;
        }
      ];

      extract-archive = [
        {
          run = "ouch d -y %s";
          desc = "Extract files via ouch";
        }
      ];

      keepassdb-open = [
        {
          run = "keepassxc %s";
          desc = "Open keepass password db";
        }
      ];

      prism-import = [
        {
          run = "prismlauncher %s";
          desc = "Import modpack to Prismlauncher";
        }
      ];

      umu-run = [
        {
          run = "umu-run %s";
          desc = "Open windows exe via umu-run";
          block = true;
        }
      ];

      uwu-run = [
        {
          run = "uwu-run %s";
          desc = "Open windows exe via uwu-run";
          block = true;
        }
      ];

      native-run = lib.mkIf config.programs.steam.enable [
        {
          run = "steam-run %s";
          desc = "Open native bin via steam-run";
          orphan = true;
          block = true;
        }
      ];

      qbttorrent-add = lib.mkIf config.services.qbittorrent.enable [
        {
          run = "qbt torrent add file %s";
          desc = "Add torrent file in qbittorrent";
        }
      ];

      xdg-open = [
        {
          run = "xdg-open %s";
          desc = "Open via xdg-open";
        }
      ];
    };

    open = {
      prepend_rules = lib.mkMerge [
        (mkRuleUrl
          [
            "*.kdbx"
          ]
          [ "keepassdb" ]
        )
        (mkRuleUrl
          [
            "*.exe"
            "*.msi"
          ]
          [ "uwu-run" "umu-run" ]
        )
        (mkRuleUrl
          [
            "*.csv"
            "*.tsv"
            "*.tab"
            "*.psv"
            "*.odt"
            "*.doc"
            "*.docx"
            "*.rtf"
            "*.xls"
            "*.xlsx"
            "*.xlsm"
            "*.xlsb"
            "*.ods"
            "*.odp"
            "*.ppt"
            "*.pptx"
            "*.odf"
            "*.odb"
          ]
          [ "msoffice-pdf" "msoffice" ]
        )
        (mkRuleMime
          [
            "application/zip"
          ]
          [ "extract-archive" ]
        )
        (mkRuleMime
          [
            "application/bittorrent"
          ]
          [ "edit" "qbttorrent-add" ]
        )
      ];

      rules = lib.mkMerge [
        (mkRuleMime
          [
            "image/*"
          ]
          [ "image" "xdg-open" ]
        )
        (mkRuleMime
          [
            "{audio,video}/*"
          ]
          [ "play" "xdg-open" ]
        )
        (mkRuleMime
          [
            "application/pdf"
            "application/zip"
            "application/cbt"
            "application/cbr"
            "application/cbz"
            "application/x-cbt"
            "application/x-cbr"
            "application/x-cbz"
            "application/epub+zip"
            "application/vnd.comicbook-rar"
            "application/vnd.comicbook+zip"
          ]
          [ "pdf" ]
        )
        (mkRuleMime
          [
            "application/{*zip,tar,bzip2,7z*,rar,xz,zstd,java-archive}"
          ]
          [ "extract-archive" ]
        )
        (mkRuleMime
          [
            "inode/empty"
            "application/*"
            "text/*"
          ]
          [ "edit" "native-run" ]
        )
        (mkRuleMime
          [
            "*/"
          ]
          [ "xdg-open" ]
        )
      ];
    };

    tasks.image_bound = [
      0
      0
    ];
  };

  keymap = import ../binds.nix {
    inherit pkgs lib config;
  };

  initLua = import ./lua.nix {
    inherit config;
  };

  theme = import ./theme.nix {
    inherit lib config;
  };

  plugins = import ../plugins.nix {
    inherit pkgs;
  };
}
