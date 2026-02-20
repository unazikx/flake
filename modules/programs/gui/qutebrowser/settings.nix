{
  pkgs,
  lib,
  config,
}:

let
  terminal =
    if config.hm.programs.kitty.enable then
      [
        "kitty"
        "--class"
        "termfloat"
        "-e"
      ]
    else
      [
        (lib.getExe pkgs.foot)
        "-a"
        "footfloat"
        "-e"
      ];
in

{
  inherit
    (import ./rules.nix {
      inherit
        lib
        config
        ;
    })
    quickmarks
    whitelist
    userstyle
    ;

  settings = {
    url =
      let
        cfg = config.services.glance;

        page =
          if cfg.enable then
            (lib.concatStringsSep ":" [
              cfg.settings.server.host
              (toString cfg.settings.server.port)
            ])
          else
            "qute://start";
      in
      (lib.genAttrs [
        "start_pages"
        "default_page"
      ] (_: page));

    completion.height = "75%";

    downloads = {
      position = "bottom";
      location = {
        remember = true;
      };
    };

    confirm_quit = [ "downloads" ];

    scrolling = {
      bar = "overlay";
      smooth = true;
    };

    statusbar = {
      show = "in-mode";

      widgets = [
        "keypress"
        "search_match"
        "url"
        "tabs"
        "progress"
        "scroll"
      ];
    };

    tabs = {
      show = "multiple";
      position = "top";
      tooltips = false;
      show_switching_delay = 500;

      title = {
        format = "[{index}] {current_title}";
        format_pinned = "";
      };
    };

    colors = with config.lib.stylix.colors.withHashtag; {
      tabs = {
        odd.fg = lib.mkForce base03;

        even = {
          bg = lib.mkForce base00;
          fg = lib.mkForce base03;
        };

        selected = {
          even.bg = lib.mkForce base02;
          odd.bg = lib.mkForce base02;
        };

        pinned = {
          even.bg = lib.mkForce base00;
          odd.bg = lib.mkForce base00;

          selected = {
            even.bg = lib.mkForce base02;
            odd.bg = lib.mkForce base02;
          };
        };
      };

      webpage = {
        preferred_color_scheme = "dark";
        darkmode.enabled = true;
      };

      hints = {
        bg = lib.mkForce base00;
        fg = lib.mkForce base04;

        match.fg = lib.mkForce base08;
      };
    };

    content = {
      register_protocol_handler = false;

      blocking = {
        enabled = true;

        method = "both";

        whitelist = [
          "thepiratebay.org"
          "trueachievements.com"
        ];

        adblock.lists = lib.mkIf false [
          "https://easylist.to/easylist/easylist.txt"
          "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"
          "https://easylist.to/easylist/easyprivacy.txt"
          "https://secure.fanboy.co.nz/fanboy-annoyance.txt"
          "https://easylist.to/easylist/fanboy-social.txt"
        ];
      };

      pdfjs = true;

      javascript.clipboard = "access";
    };

    hints = {
      scatter = false;
      chars = "asdfghjkl";
    };

    editor.command = terminal ++ [
      "hx"
      "{file}:{line}:{column0}"
    ];

    fileselect = {
      handler = "external";

      single_file.command = terminal ++ [
        "yazi"
        "--chooser-file"
        "{}"
      ];

      multiple_files.command = terminal ++ [
        "yazi"
        "--chooser-file"
        "{}"
      ];

      folder.command = terminal ++ [
        "yazi"
        "--chooser-file"
        "{}"
      ];
    };
  };

  extraConfig =
    # INFO:
    # mainly for ru language compatibility
    #
    # python
    ''
      config.unbind('.')

      en_keys = "qwertyuiop[]asdfghjkl;'zxcvbnm,./"+'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?'
      ru_keys = 'йцукенгшщзхъфывапролджэячсмитьбю.'+'ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДжЭЯЧСМИТЬБЮ,'
      for key in ru_keys:
          c.bindings.key_mappings[key]=en_keys[ru_keys.index(key)]

      c.content.javascript.log_message.excludes = {
          "userscript:_qute_stylesheet": [ "*Refused to apply inline style because it violates the following Content Security Policy directive: *" ],
          "userscript:_qute_js": [ "*TrustedHTML*" ]
      }
    '';
}
