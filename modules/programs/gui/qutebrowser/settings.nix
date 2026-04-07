{
  pkgs,
  lib,
  config,
}:

let
  inherit (pkgs) fetchurl;
  terminal = [
    "kitty"
    "--class"
    "termfloat"
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
      smooth = false;
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

  greasemonkey = [
    (fetchurl {
      url = "https://raw.githubusercontent.com/Frestein/dotfiles/dd86afd917806a12ca388d9e9250e4c800816e26/dot_config/private_qutebrowser/greasemonkey/Youtube-Sponsorblock.js";
      sha256 = "sha256-dJPPePmrVzm2fe0BJSaKuCORA7j2Tfly9STaegWWNDY=";
    })

    (fetchurl {
      url = "https://raw.githubusercontent.com/afreakk/greasemonkeyscripts/69df2b309eae2af18bb1d1ff1790f1d92d8e6a5d/youtube_adblock.js";
      sha256 = "sha256-AyD9VoLJbKPfqmDEwFIEBMl//EIV/FYnZ1+ona+VU9c=";
    })

    (fetchurl {
      url = "https://github.com/MALSync/MALSync/releases/download/0.12.2/malsync.user.js";
      sha256 = "sha256-r1ar8cqvsTjK/INyM0tq0zn/7qMmPe7UXxT0RPHzabU=";
    })

    (fetchurl {
      url = "https://github.com/MALSync/MALSync/releases/download/0.12.2/malsync-adult.user.js";
      sha256 = "sha256-xFjK7k1s3rVtJ5EYfUTQYB118cz0cP1O3FbTcsGq/ec=";
    })

    (fetchurl {
      url = "https://gist.githubusercontent.com/ilyhalight/6eb5bb4dffc7ca9e3c57d6933e2452f3/raw/7ab38af2228d0bed13912e503bc8a9ee4b11828d/gm-addstyle-polyfill.js";
      sha256 = "sha256-C4NkK3NGDV0XehzoStm0lTUVT6XUMy4app+vAFpxY0E=";
    })

    (fetchurl {
      url = "https://cdnjs.cloudflare.com/ajax/libs/hls.js/1.5.18/hls.light.min.js";
      sha256 = "sha256-dpILMwhk+cf2QUUaNHLhs0moVtpkzO84coRuKFlBgvk=";
    })
  ];

  perDomainSettings = {
    "accounts.google.com".content.headers.user_agent =
      "Mozilla/5.0 ({os_info}; rv:135.0) Gecko/20100101 Firefox/135";
  };
}
